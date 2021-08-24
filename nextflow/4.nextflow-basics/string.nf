#!/usr/bin/env nextflow
nextflow.enable.dsl = 2


// input parameters
params.str = 'Hello world!'


// process definitions

process splitLetters {

    input:
    val(string)

    output:
    path('chunk_*')

    script:
    """
    echo $string | xargs -n 1 | split -l 1 - chunk_
    """
}

process convertToUpper {

    input:
    path('inp')

    output:
    stdout

    script:
    """
    cat inp | tr '[a-z]' '[A-Z]'
    """
}


// workflow definition
workflow {

    // get input
    text = channel.of( params.str )

    // pipeline
    splitLetters( text )
    convertToUpper( splitLetters.out.flatten() )

    // visualise output
    convertToUpper.out.view{ it.trim() }

}
