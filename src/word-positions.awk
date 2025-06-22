#!/usr/bin/gawk -f

#
# This scripts lists the absolute positions of words in a text.
# 
# It produces an TSV file with the following fields:
# 
#  1. TOKEN: the token, i.e. a "word".
#  6. POSITIONS: the token's positions.
#
# Usage:
#
#     gawk -f word-positions.awk input.txt > output.txt
#     gawk -f word-spacer.awk input.txt | gawk -f word-positions.awk > output.txt
#
# This script only works with GNU's Awk (gawk).
#

function insert_token(token) {
	position++;
   	positions[token]=positions[token] ? positions[token] "," position : position;
}

{
    for (i = 1; i <= NF; i++) {
		insert_token($i);
    }
    insert_token("\\n");
}

END {
    print "TOKEN\tFORMATS";
    for (token in positions) {
        printf "%s\t%s\n", token, positions[token];
    }
}

