#!/bin/bash -l
  
#SBATCH --job-name=Nextflow-master-RNAseq
#SBATCH --account=pawsey0001
#SBATCH --reservation=DSW
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --time=00:30:00
 
nextflow run rnaseq.nf -profile zeus
