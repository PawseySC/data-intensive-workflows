#!/bin/bash --login
  
#SBATCH --job-name=Container_BLAST
#SBATCH --account=pawsey0001
#SBATCH --reservation=DSW
#SBATCH --partition=workq
#SBATCH --ntasks=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

module load shifter

# run BLAST with containers
srun --export=all shifter run biocontainers/blast:v2.2.31_cv2  makeblastdb -in zebrafish.1.protein.faa -dbtype prot

srun --export=all shifter run biocontainers/blast:v2.2.31_cv2  blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt
