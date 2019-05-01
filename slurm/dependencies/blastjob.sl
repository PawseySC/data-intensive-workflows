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

# Run Blast comparison
srun blastp -query ${SLURM_ARRAY_TASK_ID}.fasta -db ../zebrafish.1.protein.faa -out results.txt
