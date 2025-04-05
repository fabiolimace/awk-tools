#!/usr/bin/awk -f

#
# Reads a CSV file and prints a TSV file to standard output.
#
# Usage:
#        ./csv-to-tsv.awk input.csv > output.tsv
#        ./csv-to-tsv.awk -v SEP=";" input.csv > output.tsv
#        ./csv-to-tsv.awk -v COLUMNS=10 input.csv > output.tsv
#
# You can specify another field separator by using the `SEP` parameter, for example `-v SEP=";"`. The default is a comma.
#
# You can specify the number of fields by using the `COLUMNS` parameter, for example, `-v COLUMNS=10`. The default is the number of fields found in the header.
#
# HORIZONTAL TABULATION, CARRIAGE RETURN and LINE FEED are replaced with, respectivelly: '\t', '\r' and '\n'.
#
# Escaped quotes ("") are replaced by a single quote (").
#
# CSV IETF Specification: https://datatracker.ietf.org/doc/html/rfc4180
# TSV IANA Specification: https://www.iana.org/assignments/media-types/text/tab-separated-values
#

BEGIN {

    CR="\r";
    TAB="\t";
    COMMA=",";
    QUOTE="\"";
    SUBSTITUTE="\032";
    
    FS=COMMA;
    OFS=TAB;
    
    # set the separator
    if (SEP) FS = SEP;
    
    # set the fields number
    if (COLUMNS) FIELDS_NUMBER = COLUMNS;
    
    DISCARDED_FIELD=SUBSTITUTE;
    REGEX_ESC_QUOTE=QUOTE QUOTE;
    REGEX_BEG_QUOTE="^[ ]*" QUOTE;
    REGEX_END_QUOTE=QUOTE "[ ]*$";
    REGEX_ALONE_QUOTE="[^" QUOTE "]" QUOTE "[^" QUOTE "]";
    REGEX_FALSE_BEG_QUOTE="^[ ]*" "(" QUOTE QUOTE ")+" "[^" QUOTE "]";
    REGEX_FALSE_END_QUOTE="[^" QUOTE "]" "(" QUOTE QUOTE ")+" "[ ]*$";
    
    ERROR="";
}

function remove_field(col,    i) {
  for (i=col; i<NF; i++) {
    $i = $(i+1)
  }
  NF--
}

function discard_fields() {
    for (i = 1; i <= NF; i++) {
        # remove discarded fields
        if ($i == DISCARDED_FIELD) {
            remove_field(i--);
        }
    }
}

function error(message, line) {
    ERROR=message;
    delete lines;
    exit;
}

function is_beg_quote(v) {
    return (v ~ REGEX_BEG_QUOTE) && (v !~ REGEX_FALSE_BEG_QUOTE);
}

function is_end_quote(v) {
    return (v ~ REGEX_END_QUOTE) && (v !~ REGEX_FALSE_END_QUOTE);
}

{
    # fix CR LF
    sub(/\r$/,"");
    
    # escape CRs
    gsub(CR,"\\r");
    
    # escape TABs
    gsub(TAB,"\\t");
}

CONTINUE {
    # move on after line break
    gsub(TAB, COMMA, CONTINUE);
    $0 = CONTINUE "\\n" $0;
    CONTINUE="";
}

NF {
    
    # This forces awk to rebuild the record, using the values of the fields and OFS.
    # Read: https://www.gnu.org/software/gawk/manual/html_node/Changing-Fields.html
    $1 = $1;
    
    if (!FIELDS_NUMBER) FIELDS_NUMBER = NF;
    
    # parse all quoted fields
    for (i = 1; i <= NF; i++) {
    
        if (is_beg_quote($i) && !is_end_quote($i)) {
            for(; i < NF; i++) {
                old = i;
                new = i + 1;
                $new = $old COMMA $new;
                $old = DISCARDED_FIELD;
                if (is_end_quote($new)) break;
            }
            if (i == NF) {
                # read next line
                discard_fields();
                CONTINUE = $0;
                next;
            }
        }
        
        if (is_beg_quote($i) && is_end_quote($i)) {
            # remove extremity quotes
            sub(REGEX_BEG_QUOTE,"",$i);
            sub(REGEX_END_QUOTE,"",$i);
            if (match($i, REGEX_ALONE_QUOTE)) {
                error("near line " NR ", there is a quote that should be escaped.\n" $i);
            }
            # replece residual escaped quotes
            gsub(REGEX_ESC_QUOTE, QUOTE, $i);
        } else {
            if (index($i, QUOTE)) {
                error("near line " NR ", there is a quote that should be escaped within a quote-delimited field.\n" $i);
            }
        }
    }
    
    discard_fields();
    
    if (FIELDS_NUMBER != NF) {
        error("near line " NR ", there are " NF " fields, but there should be " FIELDS_NUMBER " fields.\n" $0);
    }
    
    lines[NR]=$0;
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

