#!/usr/bin/gawk -f

#
# The `word-counter.awk` script counts words in texts, calculating word frequency, relative frequency and more.
# 
# It produces an TSV file with the following fields:
# 
#  1. TOKEN: the token, i.e. a "word".
#  2. COUNT: the token frequency, i.e. the number of its occurrences in the text.
#  3. RATIO: the token ratio, i.e. its frequency divided by the total number of tokens.
#  4. CLASS: A (alnum), D (digit), P (punct) or NA.
#  5. STYLE: L (lowercase), U (uppercase), C (capital case) or NA.
#  6. LENGH: the token length, i.e. its number of characters.
#  7. POSITIONS: the token positions in the text.
# 
# Usage:
#
#     gawk -f word-counter.awk input.txt > output.txt
#
# This script only works with GNU's Awk (gawk).
#

function class(token) {
    if (token ~ /^[[:alpha:]-]+$/) {
        return "A"; # Alpha (with hyphen)
    } else if (token ~ /^[[:digit:]]+$/) {
        return "D"; # Digit (only)
    } else if (token ~ /^[[:punct:]]+$/) {
        return "P"; # Punct (only)
    } else {
        return "NA";
    }
}

function style(token) {
    if (token ~ /^[[:lower:]]+(-([[:lower:]]+|[[:upper:]]+|[[:alpha:]][[:lower:]]+))*$/) {
        return "L"; # Lower case: "word", "compound-word", "compound-WORD" and "compound-Word"
    } else if (token ~ /^[[:upper:]]+(-([[:lower:]]+|[[:upper:]]+|[[:alpha:]][[:lower:]]+))*$/) {
        return "U"; # Upper case: "WORD", "COMPOUND-word", "COMPOUND-WORD" and "COMPOUND-Word"
    } else if (token ~ /^[[:upper:]][[:lower:]]+(-([[:lower:]]+|[[:upper:]]+|[[:alpha:]][[:lower:]]+))*$/) {
        return "C"; # Capitalized: "Word", "Compound-word", "Compound-WORD" and "Compound-Word"
    } else {
        return "NA";
    }
}

function insert(token) {
    total++;
    counters[token]++;
    positions[token]=positions[token] ? positions[token] "," total : total;
}

function insert_puncts(token,    puncts, p) {
    split(token, puncts, "");
    for (p in puncts) {
        insert(puncts[p]);
    }
}

{
    for (i = 1; i <= NF; i++) {
        match($i, /^([[:punct:]]+)?\<(.+)\>([[:punct:]]+)?$/, matches);
        if (RSTART) {
            if (matches[1]) insert_puncts(matches[1]);
            if (matches[2]) insert(matches[2]); # word
            if (matches[3]) insert_puncts(matches[3]);
        } else {
            insert($i);
        }
    }
    insert("\\n");
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

    print "TOKEN\tCOUNT\tRATIO\tCLASS\tSTYLE\tLENGH\tPOSITIONS"
    
    for (token in counters) {
        count = counters[token];
        ratio = counters[token] / total;
        printf "%s\t%d\t%.9f\t%s\t%s\t%d\t%s\n", token, count, ratio, class(token), style(token), length(token), positions[token];
    }
}

