#!/bin/bash -l

#SBATCH --job-name=Nextflow-master-BLAST
#SBATCH --account=pawsey0001
#SBATCH --reservation=DSW
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --time=00:30:00

nextflow -C zeus.config run blast.nf -profile zeus,reservation
