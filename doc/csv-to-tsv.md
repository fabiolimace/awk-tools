CSV to TSV
==================================

Description
----------------------------------

The `csv-to-tsv.awk` program reads a CSV file and prints a TSV file to standard output.

Usage:

    ./csv-to-tsv.awk input.csv > output.tsv
    ./csv-to-tsv.awk -v SEP=";" input.csv > output.tsv
    ./csv-to-tsv.awk -v COLUMNS=10 input.csv > output.tsv

You can specify another field separator by using the `SEP` parameter, for example `-v SEP=";"`. The default is a comma.

You can specify the number of fields by using the `COLUMNS` parameter, for example, `-v COLUMNS=10`. The default is the number of fields found in the header.

HORIZONTAL TABULATION, CARRIAGE RETURN and LINE FEED are replaced with, respectivelly: '\t', '\r' and '\n'.

Escaped quotes ("") are replaced by a single quote (").

CSV IETF Specification: https://datatracker.ietf.org/doc/html/rfc4180
TSV IANA Specification: https://www.iana.org/assignments/media-types/text/tab-separated-values

Demonstration
----------------------------------

In this example, the program parses a messed up CSV file and prints a TSV file:

```bash
$ awk -f csv-to-tsv.awk -v example.csv
```
```
Year	Make	Model	Description	Price
1997	Ford	E350	ac, abs, moon	3000.00
1999	Chevy	Venture "Extended Edition"		4900.00
1999		Venture "Extended Edition", Very Large	n/a	5000.00
1999		Adventure "Extended Edition, Not Very Large"	n/a	5000.00
1996	Jeep	Grand Cherokee	MUST SELL!\n1. air,\n2. moon roof,\n3. loaded	4799.00
	Fiat	Uno	"Way" 1.0	R$ 9999.00
1900	"Fiat"	Palio	1.6 "Essence"	R$ 9999,00
	Wolkswagen	Gol	"G3"	R$ 9999,00
```

Formatted markdown output:

```
$ awk -f csv-to-tsv.awk -v example.csv \
    | sed "s/\t/|/g;s/^/|/;s/$/|/"  \
    | awk '{ print; if (NR == 1) { gsub(/[^|]/,"-"); print } }'
```

|Year|Make|Model|Description|Price|
|----|----|-----|-----------|-----|
|1997|Ford|E350|ac, abs, moon|3000.00|
|1999|Chevy|Venture "Extended Edition"||4900.00|
|1999||Venture "Extended Edition", Very Large|n/a|5000.00|
|1999||Adventure "Extended Edition, Not Very Large"|n/a|5000.00|
|1996|Jeep|Grand Cherokee|MUST SELL!<br>1. air,<br>2. moon roof,<br>3. loaded|4799.00|
||Fiat|Uno|"Way" 1.0|R$ 9999.00|
|1900|"Fiat"|Palio|1.6 "Essence"|R$ 9999,00|
||Wolkswagen|Gol|"G3"|R$ 9999,00|

Original contents of `example.csv`:

```
Year,Make,Model,Description,Price
1997,Ford,E350,"ac, abs, moon",3000.00
1999,Chevy,"Venture ""Extended Edition""","",4900.00
1999,,"Venture ""Extended Edition"", Very Large",n/a,5000.00
1999,"","Adventure ""Extended Edition, Not Very Large""","n/a",5000.00
1996,Jeep,Grand Cherokee,"MUST SELL!
1. air,
2. moon roof,
3. loaded",4799.00
,"Fiat",Uno,"""Way"" 1.0",R$ 9999.00
1900,"""Fiat""",Palio,"1.6 ""Essence""","R$ 9999,00"
"",Wolkswagen,"Gol","""G3""","R$ 9999,00"
```

Note: the CSV file was messed up on purpose, to test the limits of the script.


