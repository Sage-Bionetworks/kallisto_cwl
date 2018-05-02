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
     
  fastq1:
    type: File
    inputBinding: 
      position: 4

  fastq2:
    type: File
    inputBinding: 
      position: 5

baseCommand: [ kallisto, quant ]

arguments: [ "--output-dir", out ]

outputs:

  h5:
    type: File
    outputBinding:
      glob: out/abundance.h5