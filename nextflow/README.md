## Scale out containerized workflow pipelines using Nextflow

Subdirectories in this path contain the required files to run container and Nextflow examples.

In particular, example 2 has a `Dockerfile` to build a Docker container, 
whereas examples 4-6 have the required files to run Nextflow pipelines: 
pipeline (`.nf`) scripts, configuration (`nextflow.config`) scripts, sample input data.

All of these subdirectories also contain bash scripts (`.sh`) reproducing the commands shown during the live demo.
Scripts containing the `-zeus` suffix need to be run on the Zeus cluster at Pawsey.

Notably, some Nextflow examples are adapted from existing tutorial pipelines:
* example 5 : <https://github.com/nextflow-io/blast-example>
* example 6 : <https://github.com/nextflow-io/rnaseq-nf> (released under the Mozilla Public License Version 2.0)
