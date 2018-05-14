require(yaml)
require(purrr)

create_kallisto_index_yaml <- function(
    yaml_file,
    fasta_file,
    index_file_string){
    
    arg_list = list(
        "fasta_file" = file_to_yaml_file(fasta_file),
        "index_file_string" = index_file_string)
    yaml::write_yaml(arg_list, yaml_file)
}

create_kallisto_quant_yaml <- function(
    yaml_file, fastq1, fastq2, index,
    threads = NULL){
    
    arg_list = list(
        "fastq1" = file_to_yaml_file(fastq1),
        "fastq2" = file_to_yaml_file(fastq2),
        "index" = file_to_yaml_file(index)
    )
    
    option_list = 
        list("threads" = as.integer(threads)) %>% 
        purrr::discard(is.null)
    yaml::write_yaml(c(arg_list, option_list), yaml_file)
}

create_kallisto_workflow_yaml <- function(
    yaml_file, fastq1, fastq2, index,
    threads = NULL){
    
    arg_list = list(
        "FASTQ_FILE1" = file_to_yaml_file(fastq1),
        "FASTQ_FILE1" = file_to_yaml_file(fastq2),
        "INDEX_FILE" = file_to_yaml_file(index)
    )
    
    option_list = 
        list("THREADS" = as.integer(threads)) %>% 
        purrr::discard(is.null)
    yaml::write_yaml(c(arg_list, option_list), yaml_file)
}

create_kallisto_h5dump_yaml <- function(h5){
    arg_list = list("h5" = file_to_yaml_file(h5))
    yaml::write_yaml(h5, yaml_file)
}

file_to_yaml_file <- function(file){
    list("path" = file, "class" = "File")
}
