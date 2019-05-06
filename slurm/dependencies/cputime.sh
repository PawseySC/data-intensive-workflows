#!/bin/bash
# This echo statement uses sacct SLURM command to sum cputime of all job steps for given job IDs 
echo "Summarised CPUtime:" `sacct -j $1 -X -o ElapsedRaw -n | awk '{sum+=$1} END {print sum}'`
