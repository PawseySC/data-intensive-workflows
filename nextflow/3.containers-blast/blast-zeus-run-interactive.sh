#!/bin/bash

module load singularity

# run BLAST with containers
singularity exec blast_v2.2.31_cv2.sif  makeblastdb -in zebrafish.1.protein.faa -dbtype prot

singularity exec blast_v2.2.31_cv2.sif  blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt
