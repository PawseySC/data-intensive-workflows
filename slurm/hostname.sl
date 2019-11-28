#!/bin/bash -l
#SBATCH --reservation=courseq
#SBATCH --job-name=myjob
#SBATCH --account=courses01
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

#The next line is executed on the compute node
hostname

