#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: insilicodb/kallisto

inputs:
 
  index:
    type: File
    inputBinding:
      prefix: "--index"

  threads:
    type: int
    inputBinding:
      prefix: "--threads"
     
  fastqs:
    type: File[]

baseCommand: [ kallisto, quant ]

arguments: [ "--output-dir", out ]

outputs:

  h5:
    type: File
    outputBinding:
      glob: out/abundance.h5

  tsv:
    type: File
    outputBinding:
      glob: abundances.tsv

  log:
    type: File
    outputBinding:
      glob: run_info.json