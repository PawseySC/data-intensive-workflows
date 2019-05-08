#!/bin/bash -l
  
#SBATCH --job-name=Nextflow-master-RNAseq
#SBATCH --account=pawsey0001
#SBATCH --reservation=DSW
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --time=03:00:00
 
nextflow run rnaseq.nf -profile zeus --reads "data2/*_{1,2}.fq"
