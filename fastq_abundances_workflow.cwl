#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

inputs:
  index_file: File
  threads: ["null", int]
  fastq_file1: File
  fastq_file2: File

outputs:
  abundance_tsv: 
    type: File
    outputSource: [h5dump/tsv]

steps:

  quant:
    run: quant.cwl
    in: 
      index: index_file
      threads: threads
      fastq1: fastq_file1
      fastq2: fastq_file2
    out: [h5]

  h5dump:
    run: h5dump.cwl
    in: 
      h5: quant/h5
    out: [tsv]