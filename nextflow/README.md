## Scale out containerized workflow pipelines using Nextflow

Subdirectories in this path contain the required files to run container and Nextflow examples.

In particular, example 2 has a `Dockerfile` to build a Docker container, 
whereas examples 4-7 have the required files to run Nextflow pipelines: 
pipeline (`.nf`) scripts, configuration (`nextflow.config`) scripts, sample input data.

All of these subdirectories also contain bash scripts (`.sh`) reproducing the commands shown during the live demo.
Scripts containing the `-shifter` suffix need to be run on a HPC system with Shifter installed.

Notably, some Nextflow examples are adapted from existing tutorial pipelines:
* example 5 : <https://github.com/nextflow-io/blast-example>
* examples 6-7 : <https://github.com/nextflow-io/rnaseq-nf> (released under the Mozilla Public License Version 2.0)
