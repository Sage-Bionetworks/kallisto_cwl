#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: insilicodb/kallisto

inputs:
 
  h5:
    type: File
    inputBinding: 
      position: 2

baseCommand: [ kallisto, h5dump ]

arguments: [ "--output-dir", out ]

outputs:

  tsv:
    type: File
    outputBinding:
      glob: out/abundance.tsv