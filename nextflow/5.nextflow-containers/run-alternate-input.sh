#!/bin/bash

nextflow run blast.nf -with-docker --query 'data/sample?.fa'

ls -ltr
