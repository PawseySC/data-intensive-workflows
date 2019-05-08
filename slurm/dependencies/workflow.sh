#!/bin/bash
FIRST=$(sbatch download.sl | cut -f 4 -d' ')
echo $FIRST submitted
SECOND=$(sbatch -d afterok:$FIRST blastjob.sl | cut -f 4 -d' ')
echo $SECOND submitted
