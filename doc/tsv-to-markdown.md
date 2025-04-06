TSV to Markdown
==================================

Description
----------------------------------

The `tsv-to-markdown.awk` script converts a TSV file into a Markdown table.

The first line is interpreted as a table header.

Usage:

     awk -f tsv-to-markdown.awk input.txt > output.md

Demonstration
----------------------------------

In this exemple, a messed up TSV file is converted into a markdown table:


```
awk -f tsv-to-markdown.awk input.txt > output.md
```

Input file contents:


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

Output file contents:

```
|Year|Make|Model|Description|Price|
|----|----|-----|-----------|-----|
|1997|Ford|E350|ac, abs, moon|3000.00|
|1999|Chevy|Venture "Extended Edition"||4900.00|
|1999||Venture "Extended Edition", Very Large|n/a|5000.00|
|1999||Adventure "Extended Edition, Not Very Large"|n/a|5000.00|
|1996|Jeep|Grand Cherokee|MUST SELL!\n1. air,\n2. moon roof,\n3. loaded|4799.00|
||Fiat|Uno|"Way" 1.0|R$ 9999.00|
|1900|"Fiat"|Palio|1.6 "Essence"|R$ 9999,00|
||Wolkswagen|Gol|"G3"|R$ 9999,00|
```

Formatted Output file:

|Year|Make|Model|Description|Price|
|----|----|-----|-----------|-----|
|1997|Ford|E350|ac, abs, moon|3000.00|
|1999|Chevy|Venture "Extended Edition"||4900.00|
|1999||Venture "Extended Edition", Very Large|n/a|5000.00|
|1999||Adventure "Extended Edition, Not Very Large"|n/a|5000.00|
|1996|Jeep|Grand Cherokee|MUST SELL!\n1. air,\n2. moon roof,\n3. loaded|4799.00|
||Fiat|Uno|"Way" 1.0|R$ 9999.00|
|1900|"Fiat"|Palio|1.6 "Essence"|R$ 9999,00|
||Wolkswagen|Gol|"G3"|R$ 9999,00|


