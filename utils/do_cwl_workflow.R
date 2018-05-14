library(purrr)
library(readr)
library(dplyr)
library(stringr)

args <- commandArgs(trailingOnly=TRUE)
manifest <- args[1]
manifest_df <- readr::read_tsv(manifest)

do_cwl <- function(row){
    stderr <- system2(
        "cwltool", 
        args = c("kallisto_cwl/fastq_abundances_workflow.cwl", row$yaml), 
        stderr = T)
    writeLines(stderr, row$log)
    file.rename("abundance.tsv", row$tsv)
}

manifest_df %>% 
    split(1:nrow(.)) %>% 
    purrr::walk(do_cwl)