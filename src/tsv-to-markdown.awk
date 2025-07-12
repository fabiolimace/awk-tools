#!/usr/bin/mawk -f

# 
# Converts a TSV file into a Markdown table.
#
# The first line is interpreted as a table header.
#
# Usage:
#     awk -f tsv-to-markdown.awk input.tsv > output.md
#
# Repository: https://github.com/fabiolimace/awk-tools/
#

NF {
    gsub(/\|/ ,"\\|");
    gsub(/\t/ ,"|");
    gsub( /^/ ,"|");
    gsub( /$/ ,"|");
    lines[n++] = $0;

    if (n == 1) {
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


