Fixed Width Format
==================================

Definition
----------------------------------


The script `fixed-width-format.awk` converts a fixed-width file to a delimiter-separated file such as CSV and TSV.

Parameters:

 *  FIELD_WIDTHS: a space-separated list the numbers of characters of each field in order of occurence.
 *  SEPARATOR: the character used to separate the fields in the output. The default separator is a tabulation.

Usage:

```
cat <<EOF | awk -v FIELD_WIDTHS="5 5 5 5 5" -v SEPARATOR="," -f fixed-width-format.awk 
1111122222333334444455555
1234512345123451234512345
EOF
11111,22222,33333,44444,55555
12345,12345,12345,12345,12345
```

It may be useful for implementations of AWK other than GNU's AWK, which supports splitting fixed-width files into fields, such as Debian's Mawk and Busybox's Awk.

This script was partially moved from <https://gist.github.com/fabiolimace/7bfb971bae404b170e279019a2316f6b>. Thare are other versions of this script in Bash Language.

Read: https://en.wikipedia.org/wiki/Flat-file_database#Fixed-width_formats


