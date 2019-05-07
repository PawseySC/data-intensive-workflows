#!/bin/bash -l

#SBATCH --job-name=Nextflow-master
#SBATCH --account=pawsey0001
#SBATCH --reservation=
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --time=00:30:00

nextflow -C zeus.config run blast.nf -profile zeus
