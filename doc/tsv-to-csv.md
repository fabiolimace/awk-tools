TSV to CSV
==================================

Description
----------------------------------

The `tsv-to-csv.awk` program reads a TSV file and prints a CSV file to standard output.

Also reads DSV files by choosing a field separator other than a TAB.

Usage:

    ./tsv-to-csv.awk input.tsv > output.csv
    ./tsv-to-csv.awk -v SEP=";" input.tsv > output.csv
    ./tsv-to-csv.awk -v COLUMNS=10 input.tsv > output.csv
    ./tsv-to-csv.awk input.tsv | sed -E 's/\r$//' > output.csv

You can specify another field separator by using the `SEP` parameter, for example `-v SEP=":"`. However, If you change the field separator, the input file will be read as a generic DSV (delimited-separated value) file. The default is a TAB.

You can specify the number of fields by using the `COLUMNS` parameter, for example, `-v COLUMNS=10`. The default is the number of fields found in the header.

Escape sequences for HORIZONTAL TABULATION, CARRIAGE RETURN and LINE FEED, namelly '\t', '\r' and '\n', are replaced with their respective ASCII characters.

All fields in the output file are delimited by quotes. Additionally, all output lines end with the CARRIAGE RETURN and LINE FEED pair, as specified in RFC 4180.

CSV IETF Specification: https://datatracker.ietf.org/doc/html/rfc4180
TSV IANA Specification: https://www.iana.org/assignments/media-types/text/tab-separated-values

Demonstration
----------------------------------

In this example, the program parses the output of `csv-to-tsv.awk` and prints a TSV file:

```bash
awk -f csv-to-tsv.awk example.csv | awk -f tsv-to-csv.awk 
```
```
"Year","Make","Model","Description","Price"
"1997","Ford","E350","ac, abs, moon","3000.00"
"1999","Chevy","Venture ""Extended Edition""","","4900.00"
"1999","","Venture ""Extended Edition"", Very Large","n/a","5000.00"
"1999","","Adventure ""Extended Edition, Not Very Large""","n/a","5000.00"
"1996","Jeep","Grand Cherokee","MUST SELL!
1. air,
2. moon roof,
3. loaded","4799.00"
"","Fiat","Uno","""Way"" 1.0","R$ 9999.00"
"1900","""Fiat""","Palio","1.6 ""Essence""","R$ 9999,00"
"","Wolkswagen","Gol","""G3""","R$ 9999,00"
```

All fields, in the output file, are delimited by quotes and all lines end with `CR+LF`, as specified in RFC 4180.

The original file is in the page dedicated to `csv-to-tsv.awk`.

