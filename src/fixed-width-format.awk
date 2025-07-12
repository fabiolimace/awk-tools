#!/usr/bin/awk -f

#
# Convert a fixed-width file to a delimiter-separated file such as CSV and TSV.
#
# Parameters:
#
#     FIELD_WIDTHS: a space-separated list the numbers of characters of each field in order of occurence.
#     SEPARATOR: the character used to separate the fields in the output. The default separator is a tabulation.
#
# Usage:
#
#     cat <<EOF | awk -v FIELD_WIDTHS="5 5 5 5 5" -v SEPARATOR="," -f fixed-width-format.awk 
#     1111122222333334444455555
#     1234512345123451234512345
#     EOF
#     11111,22222,33333,44444,55555
#     12345,12345,12345,12345,12345
# 
# It may be useful for implementations of AWK other than GNU's AWK, which supports splitting fixed-width files into fields.
#
# Read: https://en.wikipedia.org/wiki/Flat-file_database#Fixed-width_formats
#
# Repository: https://github.com/fabiolimace/awk-tools/
#

BEGIN {
    SEP = SEPARATOR ? SEPARATOR : "\t";
    split(FIELD_WIDTHS, FIELD_WIDTHS_ARRAY);
    NUMBER_OF_FIELDS = length(FIELD_WIDTHS_ARRAY);
}

function split_into_fields() {
    position = 0;
    for (i = 1; i <= NUMBER_OF_FIELDS; i++) {
        position = position + FIELD_WIDTHS_ARRAY[i] + 1;
        if (position <= length($0)) {
            $0 = substr($0, 1, position - 1) SEP substr($0, position);
        }
    }
}

{
    split_into_fields();
    print $0;
}

