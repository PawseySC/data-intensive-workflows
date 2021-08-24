/*
 * Copyright (c) 2013-2019, Centre for Genomic Regulation (CRG).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * This Source Code Form is "Incompatible With Secondary Licenses", as
 * defined by the Mozilla Public License, v. 2.0.
 *
 */

/*
 * Proof of concept of a RNAseq pipeline implemented with Nextflow
 *
 * Authors:
 * - Paolo Di Tommaso <paolo.ditommaso@gmail.com>
 * - Emilio Palumbo <emiliopalumbo@gmail.com>
 * - Evan Floden <evanfloden@gmail.com>
 */

nextflow.enable.dsl = 2


// input parameters
params.reads = "$baseDir/data/ggal/*_{1,2}.fq"
//
params.transcriptome = "$baseDir/data/ggal/ggal_1_48850000_49020000.Ggal71.500bpflank.fa"
params.multiqc = "$baseDir/multiqc"
params.outdir = "results"

log.info """\
 R N A S E Q - N F   P I P E L I N E
 ===================================
 transcriptome: ${params.transcriptome}
 reads        : ${params.reads}
 outdir       : ${params.outdir}
 """


// process definitions

process index {
    tag "$transcriptome.simpleName"

    input:
    path(transcriptome)

    output:
    path('index')

    script:
    """
    salmon index --threads $task.cpus -t $transcriptome -i index
    """
}

process fastqc {
    tag "FASTQC on $sample_id"
    publishDir params.outdir

    input:
    tuple val(sample_id), path(reads)

    output:
    path("fastqc_${sample_id}_logs")


    script:
    """
    mkdir fastqc_${sample_id}_logs
    fastqc -o fastqc_${sample_id}_logs -f fastq -q ${reads}
    """
}

process quant {
    tag "$pair_id"

    input:
    path(index)
    tuple val(pair_id), path(reads)

    output:
    path(pair_id)

    script:
    """
    salmon quant --threads $task.cpus --libType=U -i $index -1 ${reads[0]} -2 ${reads[1]} -o $pair_id
    """
}

process multiqc {
    publishDir params.outdir, mode:'copy'

    input:
    path('*')
    path(config)

    output:
    path('multiqc_report.html')

    script:
    """
    cp $config/* .
    echo "custom_logo: \$PWD/logo.png" >> multiqc_config.yaml
    multiqc .
    """
}


// workflow definition

workflow {

    read_pairs = Channel.fromFilePairs( params.reads, checkIfExists: true )

    index( params.transcriptome )
    fastqc( read_pairs )
    quant( index.out, read_pairs )
    multiqc( quant.out
                  .concat(fastqc.out)
                  .collect() ,
             params.multiqc )

}

workflow.onComplete {
	log.info ( workflow.success ? "\nDone! Open the following report in your browser --> ${params.outdir}/multiqc_report.html\n" : "Oops .. something went wrong" )
}
