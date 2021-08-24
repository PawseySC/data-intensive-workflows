#!/usr/bin/env nextflow

/*
 *
 * Copyright (c) 2013-2018, Centre for Genomic Regulation (CRG).
 * Copyright (c) 2013-2018, Paolo Di Tommaso and the respective authors.
 *
 *   This file is part of 'Nextflow'.
 *
 *   Nextflow is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   Nextflow is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Nextflow.  If not, see <http://www.gnu.org/licenses/>.
 */
 

// input parameters
params.query = "$baseDir/data/sample.fa"

params.db = "$baseDir/db/pdb/tiny"
params.chunkSize = 2
params.outdir = "."


Channel
    .fromPath(params.query)
    .map{ it -> [ it.name, it ] }
    .splitFasta( by: params.chunkSize, elem: 1, file: true )
    .set { fasta }


// process definitions

process blast {
    input:
    set name, file('query.fa') from fasta

    output:
    set name, file('top_hits') into top_hits

    script:
    """
    blastp -db ${params.db} -query query.fa -outfmt 6 > blast_result
    cat blast_result | head -n 10 | cut -f 2 > top_hits
    """
}

process extract {
    input:
    set name, file('top_hits') from top_hits

    output:
    set name, file('sequences') into sequences

    script:
    """
    blastdbcmd -db ${params.db} -entry_batch top_hits | head -n 10 > sequences
    """
}

/* 
 * Collects all the sequences files into a single file 
 * and stores it in the output directory when complete
 */ 
sequences
    .collectFile()
    .subscribe{ it.copyTo( "${params.outdir}/${it.baseName}.out" ) }
