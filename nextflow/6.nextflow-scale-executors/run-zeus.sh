#!/bin/bash -l
  
#SBATCH --job-name=Nextflow-master-RNAseq
#SBATCH --account=pawsey0001
#SBATCH --reservation=DSW
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --time=02:00:00
 
nextflow run rnaseq.nf
