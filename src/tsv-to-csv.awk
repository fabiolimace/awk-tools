#!/usr/bin/awk -f

#
# Reads a TSV file and prints a CSV file to standard output.
#
# Also reads DSV files by choosing a field separator other than a TAB.
#
# Usage:
#        ./tsv-to-csv.awk input.tsv > output.csv
#        ./tsv-to-csv.awk -v SEP=";" input.tsv > output.csv
#        ./tsv-to-csv.awk -v COLUMNS=10 input.tsv > output.csv
#        ./tsv-to-csv.awk input.tsv | sed -E 's/\r$//' > output.csv
#
# You can specify another field separator by using the `SEP` parameter, for example `-v SEP=":"`. However, If you change the field separator, the input file will be read as a generic DSV (delimited-separated value) file. The default is a TAB.
#
# You can specify the number of fields by using the `COLUMNS` parameter, for example, `-v COLUMNS=10`. The default is the number of fields found in the header.
#
# Escape sequences for HORIZONTAL TABULATION, CARRIAGE RETURN and LINE FEED, namelly '\t', '\r' and '\n', are replaced with their respective ASCII characters.
#
# All fields in the output file are delimited by quotes. Additionally, all output lines end with the CARRIAGE RETURN and LINE FEED pair, as specified in RFC 4180.
#
# CSV IETF Specification: https://datatracker.ietf.org/doc/html/rfc4180
# TSV IANA Specification: https://www.iana.org/assignments/media-types/text/tab-separated-values
#

BEGIN {

    LF="\n";
    CR="\r";
    TAB="\t";
    COMMA=",";
    QUOTE="\"";
    
    FS=TAB;
    
    # set the separator
    if (SEP) FS = SEP;
    
    # set the fields number
    if (COLUMNS) FIELDS_NUMBER = COLUMNS;
    
    ERROR="";
}

function error(message, line) {
    ERROR=message;
    delete lines;
    exit;
}

NF {

    if (!FIELDS_NUMBER) FIELDS_NUMBER = NF;
    
    line = "";
    for (i = 1; i <= NF; i++) {
    
        # lets escape the quotes
        gsub(QUOTE, QUOTE QUOTE, $i);
        
        # putting delimiters
        if (line) line = line COMMA;
        line = line QUOTE $i QUOTE;
    }
    
    if (FIELDS_NUMBER != NF) {
        error("at line " NR ", there are " NF " fields, but there should be " FIELDS_NUMBER " fields.\n" $0);
    }

    gsub(/\\t/, TAB, line);
    gsub(/\\r/, CR, line);
    gsub(/\\n/, LF, line);
    gsub(/$/, CR, line);
    
    lines[NR]=line;
}

END {

    if (ERROR) {
        print "ERROR: " ERROR > "/dev/stderr";
        exit 1;
    }
    
    # print sorted lines
    for(i = 1; i <= NR; i++) {
        if (lines[i]) {
            print lines[i];
        }
    }
}

