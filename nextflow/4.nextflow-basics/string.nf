#!/usr/bin/env nextflow

params.str = 'Hello world!'

text = Channel.from( params.str )

process splitLetters {

    input:
    val string from text

    output:
    stdout word into letters mode flatten

    """
    echo $string | xargs -n 1
    """
}

process convertToUpper {

    input:
    stdin word from letters

    output:
    stdout result

    """
    cat - | tr '[a-z]' '[A-Z]'
    """
}

result.subscribe {
    log.info(it.trim())
//    println it.trim()
}
