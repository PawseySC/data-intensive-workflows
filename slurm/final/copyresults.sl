#!/bin/bash
#SBATCH -n 1
#SBATCH -t 00:02:00
#SBATCH -A pawsey0001
#SBATCH -p copyq
#SBATCH -M zeus
#SBATCH --export=NONE

# Copying from /scratch to /group
mkdir -p ${MYGROUP}/dsw_results
cp "result*.txt" ${MYGROUP}/dsw_results

# Copying to long term storage
# pshell "mkdir /projects/dsw_results && cd /projects/dsw_results && put result*.txt"
