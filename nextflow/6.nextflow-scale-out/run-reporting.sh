#!/bin/bash

nextflow run rnaseq.nf -with-timeline -with-report -with-dag

dot -Tpng dag.dot > dag.png
