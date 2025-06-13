Word Counter
==================================

Description
----------------------------------

The `word-counter.awk` script counts words in texts, calculating word frequency, relative frequency and more.

It produces an TSV file with the following fields:

 1. TOKEN: the token, i.e. a "word".
 2. COUNT: the token frequency, i.e. the number of its occurrencies in the text.
 3. RATIO: the token ratio, i.e. its frequency divided by the total number of tokens.
 4. CLASS: A (alnum), D (digit), P (punct) or NA.
 5. STYLE: L (lowercase), U (uppercase), C (capital case) or NA.
 6. LENGH: the token length, i.e. its number of characters.
 7. POSITIONS: the token positions in the text.

Demonstration
----------------------------------

In this example, the script processes [a text from G1](https://g1.globo.com/to/tocantins/quiz/jovem-consegue-roer-108-pequis-em-dez-minutos-e-vence-concurso-durante-festival-em-gurupi.ghtml).

```bash
gawk -f word-counter.awk input.txt > output.txt
```

This is the input:

```
cat input.txt;
```
```
26/11/2022 11h33 Atualizado 26/11/2022
Fernando Gonçalves conseguiu roer 108 pequis — Foto: Ricardo Pelizzari/Secom Gurupi
O jovem Fernando Gonçalves foi o vencedor do concurso de roedor de pequi de Gurupi após roer 108 caroços do fruto. Na categoria feminina, Francinalva Barros Rodrigues conseguiu roer 64 e conquistou o primeiro lugar. Os dois faturaram um prêmio de R$ 1,2 mil.
O 2º Festival do Pequi foi realizado na noite desta sexta-feira (25). O evento é realizado pela Universidade Federal do Tocantins em parceria com a Prefeitura de Gurupi e também premiou os melhores pratos feitos à base do fruto.
"Estou muito feliz. É a segunda vez que participo e da primeira vez não deu certo, roí 48 e agora foram 64”, contou Francinalva Barros.
O Fernando Gonçalves estabeleceu uma nova marca na competição e contou o segredo de roer tantos pequis. “Ser tocantinense já é o grande segredo. Pequi gostoso, qualidade boa, foi só se esforçar para conseguir chegar aos 108 caroços em 10 minutos”, contou.
Francinalva Barros venceu na categoria feminina — Foto: Ricardo Pelizzari – Secom Gurupi
O Festival do Pequi faz parte do calendário cultural de Gurupi e também teve apoio do Serviço Brasileiro de Apoio às Micro e Pequenas Empresas (Sebrae). A disputa gastronômica ocorreu nos dias 23 e 24, quando vários cozinheiros elaboraram receitas diversificadas à base de pequi.
Todos os competidores receberam premiações em dinheiro.
Veja os vencedores por categoria:
Prato Salgado com pequi
Salmão ao molho de pequi - Ângela Maria de Morais
Comidinha Salgada ou Doce com pequi
Pequiche - Márcia Geraldo de Sousa
Prato Doce com pequi
Manjar de pequi com castanha de pequi - Willian Gomes Ferreira
O festival também premiou vídeos sobre o fruto do cerrado feitos por jovens da cidade.
Vídeos com pequi com alunos do Ensino Médio
Pequi tocantinense - Marcela Borges Dias da Silva, do Centro de Ensino Médio Bom Jesus
Curta-metragem Pequi na Tela
Pequi: Espinhos e Doçuras - Hadassa Raquel de Oliveira Freire
```

This is the output:

```
cat output.txt
```
```
TOKEN	COUNT	RATIO	CLASS	STYLE	LENGH	POSITIONS
premiações	1	0.002604167	A	L	10	266
É	1	0.002604167	A	U	1	118
Doce	2	0.005208333	A	C	4	297,309
pela	1	0.002604167	A	L	4	88
Atualizado	1	0.002604167	A	C	10	3
ao	1	0.002604167	A	L	2	284
cultural	1	0.002604167	A	L	8	219
sexta-feira	1	0.002604167	A	L	11	79
desta	1	0.002604167	A	L	5	78
uma	1	0.002604167	A	L	3	149
Festival	2	0.005208333	A	C	8	71,212
Todos	1	0.002604167	A	C	5	262
Prato	2	0.005208333	A	C	5	278,308
Brasileiro	1	0.002604167	A	C	10	228
muito	1	0.002604167	A	L	5	115
Empresas	1	0.002604167	A	C	8	235
Médio	2	0.005208333	A	C	5	349,364
Gomes	1	0.002604167	A	C	5	322
–	1	0.002604167	P	NA	1	207
roedor	1	0.002604167	A	L	6	29
—	2	0.005208333	P	NA	1	12,202
Borges	1	0.002604167	A	C	6	355
Manjar	1	0.002604167	A	C	6	313
em	3	0.007812500	A	L	2	93,188,267
Barros	3	0.007812500	A	C	6	46,142,197
por	2	0.005208333	A	L	3	274,336
vários	1	0.002604167	A	L	6	251
cidade	1	0.002604167	A	L	6	339
11h33	1	0.002604167	NA	NA	5	2
Raquel	1	0.002604167	A	C	6	380
Ricardo	2	0.005208333	A	C	7	15,205
molho	1	0.002604167	A	L	5	285
receberam	1	0.002604167	A	L	9	265
calendário	1	0.002604167	A	L	10	218
à	2	0.005208333	A	L	1	107,256
“	1	0.002604167	P	NA	1	163
”	2	0.005208333	P	NA	1	138,191
melhores	1	0.002604167	A	L	8	104
fruto	3	0.007812500	A	L	5	39,110,332
Curta-metragem	1	0.002604167	A	C	14	368
feliz	1	0.002604167	A	L	5	116
concurso	1	0.002604167	A	L	8	27
gastronômica	1	0.002604167	A	L	12	242
10	1	0.002604167	D	NA	2	189
Estou	1	0.002604167	A	C	5	114
com	7	0.018229167	A	L	3	95,280,298,310,316,343,345
Serviço	1	0.002604167	A	C	7	227
tantos	1	0.002604167	A	L	6	160
deu	1	0.002604167	A	L	3	129
Rodrigues	1	0.002604167	A	C	9	47
Veja	1	0.002604167	A	C	4	271
vez	2	0.005208333	A	L	3	121,127
segunda	1	0.002604167	A	L	7	120
é	2	0.005208333	A	L	1	86,167
"	1	0.002604167	P	NA	1	113
dois	1	0.002604167	A	L	4	58
mil	1	0.002604167	A	L	3	66
faturaram	1	0.002604167	A	L	9	59
Pequiche	1	0.002604167	A	C	8	301
$	1	0.002604167	P	NA	1	64
Micro	1	0.002604167	A	C	5	232
para	1	0.002604167	A	L	4	182
(	2	0.005208333	P	NA	1	80,236
)	2	0.005208333	P	NA	1	82,238
pequis	2	0.005208333	A	L	6	11,161
Hadassa	1	0.002604167	A	C	7	379
venceu	1	0.002604167	A	L	6	198
jovens	1	0.002604167	A	L	6	337
conquistou	1	0.002604167	A	L	10	52
,	8	0.020833333	P	NA	1	44,131,139,174,177,192,249,359
-	5	0.013020833	A	NA	1	288,302,320,353,378
.	14	0.036458333	P	NA	1	40,56,67,83,111,117,143,162,171,194,239,260,269,340
Marcela	1	0.002604167	A	C	7	354
gostoso	1	0.002604167	A	L	7	173
também	3	0.007812500	A	L	6	101,223,327
\n	21	0.054687500	NA	NA	2	5,18,68,112,144,195,210,261,270,277,282,293,300,307,312,324,341,350,367,372,384
1,2	1	0.002604167	NA	NA	3	65
Oliveira	1	0.002604167	A	C	8	382
Ensino	2	0.005208333	A	C	6	348,363
Geraldo	1	0.002604167	A	C	7	304
Sebrae	1	0.002604167	A	C	6	237
que	1	0.002604167	A	L	3	122
já	1	0.002604167	A	L	2	166
jovem	1	0.002604167	A	L	5	20
roí	1	0.002604167	A	L	3	132
Gonçalves	3	0.007812500	A	C	9	7,22,147
:	4	0.010416667	P	NA	1	14,204,276,374
se	1	0.002604167	A	L	2	180
os	3	0.007812500	A	L	2	103,263,272
Federal	1	0.002604167	A	C	7	90
roer	4	0.010416667	A	L	4	9,35,49,159
ou	1	0.002604167	A	L	2	296
Ser	1	0.002604167	A	C	3	164
primeira	1	0.002604167	A	L	8	126
Tocantins	1	0.002604167	A	C	9	92
26/11/2022	2	0.005208333	NA	NA	10	1,4
Fernando	3	0.007812500	A	C	8	6,21,146
Jesus	1	0.002604167	A	C	5	366
A	1	0.002604167	A	U	1	240
feitos	2	0.005208333	A	L	6	106,335
lugar	1	0.002604167	A	L	5	55
Tela	1	0.002604167	A	C	4	371
da	3	0.007812500	A	L	2	125,338,357
Salmão	1	0.002604167	A	C	6	283
Morais	1	0.002604167	A	C	6	292
esforçar	1	0.002604167	A	L	8	181
de	16	0.041666667	A	L	2	28,30,32,62,98,158,220,229,258,286,291,305,314,318,362,381
grande	1	0.002604167	A	L	6	169
Freire	1	0.002604167	A	C	6	383
só	1	0.002604167	A	L	2	179
marca	1	0.002604167	A	L	5	151
agora	1	0.002604167	A	L	5	135
108	3	0.007812500	D	NA	3	10,36,186
castanha	1	0.002604167	A	L	8	317
alunos	1	0.002604167	A	L	6	346
festival	1	0.002604167	A	L	8	326
dinheiro	1	0.002604167	A	L	8	268
disputa	1	0.002604167	A	L	7	241
evento	1	0.002604167	A	L	6	85
um	1	0.002604167	A	L	2	60
Os	1	0.002604167	A	C	2	57
Willian	1	0.002604167	A	C	7	321
vídeos	1	0.002604167	A	L	6	329
primeiro	1	0.002604167	A	L	8	54
faz	1	0.002604167	A	L	3	215
Gurupi	5	0.013020833	A	C	6	17,33,99,209,221
O	6	0.015625000	A	U	1	19,69,84,145,211,325
do	11	0.028645833	A	L	2	26,38,72,91,109,213,217,226,333,347,360
Espinhos	1	0.002604167	A	C	8	375
premiou	2	0.005208333	A	L	7	102,328
Francinalva	3	0.007812500	A	C	11	45,141,196
Ferreira	1	0.002604167	A	C	8	323
Sousa	1	0.002604167	A	C	5	306
R	1	0.002604167	A	U	1	63
Pequenas	1	0.002604167	A	C	8	234
diversificadas	1	0.002604167	A	L	14	255
Comidinha	1	0.002604167	A	C	9	294
base	2	0.005208333	A	L	4	108,257
vencedor	1	0.002604167	A	L	8	25
Márcia	1	0.002604167	A	C	6	303
elaboraram	1	0.002604167	A	L	10	253
segredo	2	0.005208333	A	L	7	157,170
Maria	1	0.002604167	A	C	5	290
contou	3	0.007812500	A	L	6	140,155,193
parceria	1	0.002604167	A	L	8	94
nova	1	0.002604167	A	L	4	150
não	1	0.002604167	A	L	3	128
prêmio	1	0.002604167	A	L	6	61
cozinheiros	1	0.002604167	A	L	11	252
nos	1	0.002604167	A	L	3	244
pequi	9	0.023437500	A	L	5	31,259,281,287,299,311,315,319,344
dias	1	0.002604167	A	L	4	245
Vídeos	1	0.002604167	A	C	6	342
chegar	1	0.002604167	A	L	6	184
Dias	1	0.002604167	A	C	4	356
competidores	1	0.002604167	A	L	12	264
apoio	1	0.002604167	A	L	5	225
conseguir	1	0.002604167	A	L	9	183
Ângela	1	0.002604167	A	C	6	289
a	2	0.005208333	A	L	1	96,119
2º	1	0.002604167	NA	NA	2	70
qualidade	1	0.002604167	A	L	9	175
23	1	0.002604167	D	NA	2	246
conseguiu	2	0.005208333	A	L	9	8,48
24	1	0.002604167	D	NA	2	248
ocorreu	1	0.002604167	A	L	7	243
minutos	1	0.002604167	A	L	7	190
teve	1	0.002604167	A	L	4	224
25	1	0.002604167	D	NA	2	81
na	4	0.010416667	A	L	2	76,152,199,370
realizado	2	0.005208333	A	L	9	75,87
e	9	0.023437500	A	L	1	51,100,124,134,154,222,233,247,376
estabeleceu	1	0.002604167	A	L	11	148
Prefeitura	1	0.002604167	A	C	10	97
Pequi	6	0.015625000	A	C	5	73,172,214,351,369,373
Salgada	1	0.002604167	A	C	7	295
vencedores	1	0.002604167	A	L	10	273
Apoio	1	0.002604167	A	C	5	230
aos	1	0.002604167	A	L	3	185
feminina	2	0.005208333	A	L	8	43,201
cerrado	1	0.002604167	A	L	7	334
tocantinense	2	0.005208333	A	L	12	165,352
competição	1	0.002604167	A	L	10	153
Universidade	1	0.002604167	A	C	12	89
Foto	2	0.005208333	A	C	4	13,203
Pelizzari	1	0.002604167	A	C	9	206
48	1	0.002604167	D	NA	2	133
foi	3	0.007812500	A	L	3	23,74,178
o	5	0.013020833	A	L	1	24,53,156,168,331
Pelizzari/Secom	1	0.002604167	NA	NA	15	16
64	2	0.005208333	D	NA	2	50,137
categoria	3	0.007812500	A	L	9	42,200,275
caroços	2	0.005208333	A	L	7	37,187
parte	1	0.002604167	A	L	5	216
certo	1	0.002604167	A	L	5	130
Na	1	0.002604167	A	C	2	41
Salgado	1	0.002604167	A	C	7	279
boa	1	0.002604167	A	L	3	176
noite	1	0.002604167	A	L	5	77
Doçuras	1	0.002604167	A	C	7	377
quando	1	0.002604167	A	L	6	250
às	1	0.002604167	A	L	2	231
Secom	1	0.002604167	A	C	5	208
foram	1	0.002604167	A	L	5	136
participo	1	0.002604167	A	L	9	123
pratos	1	0.002604167	A	L	6	105
Bom	1	0.002604167	A	C	3	365
Centro	1	0.002604167	A	C	6	361
após	1	0.002604167	A	L	4	34
Silva	1	0.002604167	A	C	5	358
sobre	1	0.002604167	A	L	5	330
receitas	1	0.002604167	A	L	8	254
```

Examples
----------------------------------

In this example, the lower case tokens are sorted by frequency:

```bash
cat output.txt | gawk 'NR > 1 { TOKEN[tolower($1)] += $2 } END { for (i in TOKEN) print TOKEN[i], i; }' | sort -nr | head
```
```
21 \n
16 de
15 pequi
14 .
11 o
11 do
9 e
8 ,
7 com
5 na
```

In this example, the original text is restored using the token positions:

```bash
cat output.txt | gawk 'NR > 1 { split($7, POSITIONS, ","); for (i in POSITIONS) TOKENS[POSITIONS[i]] = $1 } END { for (i in TOKENS) printf "%s ", TOKENS[i] }' | fmt | head
```
```
26/11/2022 11h33 Atualizado 26/11/2022 \n Fernando Gonçalves conseguiu
roer 108 pequis — Foto : Ricardo Pelizzari/Secom Gurupi \n O jovem
Fernando Gonçalves foi o vencedor do concurso de roedor de pequi
de Gurupi após roer 108 caroços do fruto . Na categoria feminina ,
Francinalva Barros Rodrigues conseguiu roer 64 e conquistou o primeiro
lugar . Os dois faturaram um prêmio de R $ 1,2 mil . \n O 2º Festival
do Pequi foi realizado na noite desta sexta-feira ( 25 ) . O evento
é realizado pela Universidade Federal do Tocantins em parceria com a
Prefeitura de Gurupi e também premiou os melhores pratos feitos à base
do fruto . \n " Estou muito feliz . É a segunda vez que participo e
```

