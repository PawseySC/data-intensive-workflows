#!/bin/bash

nextflow run rnaseq.nf -profile nimbus -with-timeline -with-report -with-dag

dot -Tpng dag.dot > dag.png
