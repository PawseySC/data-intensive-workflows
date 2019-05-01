#!/bin/bash -l
#SBATCH -n 1 
#SBATCH -A pawsey0001
#SBATCH --export=NONE

# Load Blast+ module
module load blast+

# Make Blast Zebrafish DB
srun makeblastdb -in zebrafish.1.protein.faa -dbtype prot
