#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

inputs:
  INDEX_FILE: File
  THREADS: int
  FASTQ_FILE1: File
  FASTQ_FILE2: File

outputs:
  ABUNDANCE_TSV: 
    type: File
    outputSource: [H5DUMP/tsv]

steps:

  QUANT:
    run: quant.cwl
    in: 
      index: INDEX_FILE
      threads: THREADS
      fastq1: FASTQ_FILE1
      fastq2: FASTQ_FILE2
    out: [h5]

  H5DUMP:
    run: h5dump.cwl
    in: 
      h5: QUANT/h5
    out: [tsv]