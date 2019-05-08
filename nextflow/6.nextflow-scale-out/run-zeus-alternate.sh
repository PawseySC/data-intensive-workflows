#!/bin/bash
  
nextflow run rnaseq.nf -profile zeus --reads "data2/*_{1,2}.fq"
