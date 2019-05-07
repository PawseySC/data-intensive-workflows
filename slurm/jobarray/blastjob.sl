#!/bin/bash -l
#SBATCH -n 1 
#SBATCH --array=1-4
#SBATCH -A pawsey0001
#SBATCH --export=NONE

# Load Blast+ module
module load blast+

# Create a directory based on job array index and cd into it
TASKDIR=${SLURM_ARRAY_TASK_ID}
mkdir -p $TASKDIR
cd $TASKDIR

# Copy necessary files
cp ../${SLURM_ARRAY_TASK_ID}.fasta .
cp ../zebrafish.1.protein.faa .

# Make Blast Zebrafish DB
srun --export=ALL makeblastdb -in zebrafish.1.protein.faa -dbtype prot
# Run Blast comparison
srun --export=ALL blastp -query ${SLURM_ARRAY_TASK_ID}.fasta -db zebrafish.1.protein.faa -out results.txt
