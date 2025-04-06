#!/usr/bin/mawk -f

# 
# Converts a TSV file into a Markdown table.
#
# The first line is interpreted as a table header.
#
# Usage:
#     awk -f tsv-to-markdown.awk input.tsv > output.md
#

{
    gsub(/\t/ ,"|");
    gsub( /^/ ,"|");
    gsub( /$/ ,"|");
    lines[n++] = $0;

    if (NR == 1) {
        gsub(/[^|]/,"-");
        lines[n++] = $0;
    };
}

END {
    # print sorted lines
    for(i = 0; i <= n; i++) {
        if (lines[i]) {
            print lines[i];
        }
    }
}


