#!/usr/bin/gawk -f

function class(token)
{
    # TODO: Normalizar a acentuação, pois palavras como "área" não são reconhecidas corretamente; em vez disso, retornam NA.
    # TODO: Normalizar os espaços, pois palavras separadas com NBSP (0xA0) não são isoladas devidamente, formando bigramas em vez de tokens simples; Devido a isso, retornam NA.
    # TODO: Normalizar os SHY também, pelo mesmo motivo.

    switch (token) {
    case /^[[:alpha:]-]+$/:
        return "A"; # Alpha (with hyphen)
    case /^[[:digit:]]+$/:
        return "D"; # Digit (only)
    case /^[[:punct:]]+$/:
        return "P"; # Punct (only)
    default:
        return "NA";
    }
}

function style(token)
{
    switch (token) {
    case /^[[:lower:]]+(-([[:lower:]]+|[[:upper:]]+|[[:alpha:]][[:lower:]]+))*$/:
        return "L"; # Lower case: "word", "compound-word", "compound-WORD" and "compound-Word"
    case /^[[:upper:]]+(-([[:lower:]]+|[[:upper:]]+|[[:alpha:]][[:lower:]]+))*$/:
        return "U"; # Upper case: "WORD", "COMPOUND-word", "COMPOUND-WORD" and "COMPOUND-Word"
    case /^[[:upper:]][[:lower:]]+(-([[:lower:]]+|[[:upper:]]+|[[:alpha:]][[:lower:]]+))*$/:
        return "C"; # Capitalized: "Word", "Compound-word", "Compound-WORD" and "Compound-Word"
    default:
        return "NA";
    }
}

function join(array,    i, result)
{
    for (i in array) {
        if (i == 1) result = array[i];
        else result = result "," array[i];
    }
    return result
}

function insert(token) {
    total++;
    counters[token]++;
    positions[token][counters[token]]=total;
}

BEGIN {

}

{
    for (i = 1; i <= NF; i++) {

        match($i, /^([[:punct:]]+)?\<(.+)\>([[:punct:]]+)?$/, matches);
        
        # puncts before
        if (matches[1]) {
            token=matches[1];
            if (length(token) > 1) {
                split(token, puncts, //);
                for (p in puncts) {
                    insert(puncts[p]);
                }
            } else {
                insert(token);
            }
        }
        
        if (matches[2]) {
            insert(matches[2]);
        }
        
        # puncts after
        if (matches[3]) {
            token=matches[3];
            if (length(token) > 1) {
                split(token, puncts, //);
                for (p in puncts) {
                    insert(puncts[p]);
                }
            } else {
                insert(token);
            }
        }
    }
}

END {

    # start of operational checks #
    for (k in counters) {
        sum += counters[k];
    }    
    if (sum != total) {
        print "Wrong sum of counts" > "/dev/stderr";
        exit 1;
    }
    # end of operational checks #

    print "TOKEN COUNT RATIO CLASS STYLE LENGH POSITIONS"
    
    for (token in counters) {
        count = counters[token];
        ratio = counters[token] / total;
        printf "%s %d %.9f %s %s %d %s\n", token, count, ratio, class(token), style(token), length(token), join(positions[token]);
    }
}

