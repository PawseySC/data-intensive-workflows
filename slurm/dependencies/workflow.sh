#!/bin/bash
DOWNLOAD=$(sbatch download.sl | cut -f 4 -d' ')
echo $DOWNLOAD submitted
BLAST=$(sbatch -d afterok:$DOWNLOAD blastjob.sl | cut -f 4 -d' ')
echo $BLAST submitted
