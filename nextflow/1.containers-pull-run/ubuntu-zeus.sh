#!/bin/bash

module load singularity

singularity pull docker://ubuntu:18.04

singularity exec ubuntu_18.04.sif cat /etc/os-release
