library(purrr)
library(readr)
library(dplyr)
library(stringr)

args <- commandArgs(trailingOnly=TRUE)
manifest <- args[1]

yamls <- list.files() %>% 
    purrr::keep(str_detect(., ".yaml$")) 

logs <- stringr::str_replace(yamls, "yaml", "log")

do_cwl <- function(yaml, log){
    stderr <- system2(
        "cwltool", 
        args = c(cwl_file, yaml), 
        stderr = T)
    writeLines(stderr, log)
}

purrr::walk2(yamls, logs, do_cwl)
