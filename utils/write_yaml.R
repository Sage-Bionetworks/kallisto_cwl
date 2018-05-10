require(yaml)
require(purrr)


create_kallisto_index_yaml <- function(
    yaml_file,
    fasta_file,
    index_file_string){
    
    arg_list = list(
        "fasta_file" = file_to_yaml_file(fasta_file),
        "index_file_string" = index_file_string)
    yaml::write_yaml(c(arg_list, option_list), yaml_file)
}
    
file_to_yaml_file <- function(file){
    list("path" = file, "class" = "File")
}