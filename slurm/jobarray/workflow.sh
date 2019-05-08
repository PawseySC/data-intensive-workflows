#!/bin/bash
FIRST=$(sbatch download.sl | cut -f 4 -d' ')
echo $FIRST submitted
SECOND=$(sbatch -d afterok:$FIRST makedb.sl | cut -f 4 -d' ')
echo $SECOND submitted
THIRD=$(sbatch -d afterok:$SECOND blastarray.sl | cut -f 4 -d' ')
echo $THIRD submitted
