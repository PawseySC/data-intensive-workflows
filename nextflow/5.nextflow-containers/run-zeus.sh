#!/bin/bash

nextflow -C zeus.config run blast.nf -profile zeus,reservation
