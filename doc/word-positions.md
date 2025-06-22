Word Positions
==================================

Description
----------------------------------

This scripts lists the absolute positions of words in a text.
 
It produces an TSV file with the following fields:
 
 1. TOKEN: the token, i.e. a "word".
 6. POSITIONS: the token's positions.

Usage:

    gawk -f word-positions.awk input.txt > output.txt
    gawk -f word-spacer.awk input.txt | gawk -f word-positions.awk > output.txt

This script only works with GNU's Awk (gawk).


Demonstration
----------------------------------

In this example, the script processes [a text from G1](https://g1.globo.com/to/tocantins/quiz/jovem-consegue-roer-108-pequis-em-dez-minutos-e-vence-concurso-durante-festival-em-gurupi.ghtml).

```bash
gawk -f word-spacer.awk input.txt | gawk -f word-positions.awk - > output.txt
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
TOKEN	FORMATS
premiações	265
É	117
Doce	296,308
pela	87
Atualizado	3
ao	283
cultural	218
sexta-feira	78
desta	77
uma	148
Festival	70,211
Todos	261
Prato	277,307
Brasileiro	227
muito	114
Empresas	234
Médio	348,363
Gomes	321
–	206
roedor	29
—	12,201
Borges	354
Manjar	312
em	92,187,266
Barros	46,141,196
por	273,335
vários	250
cidade	338
11h33	2
Raquel	379
Ricardo	15,204
molho	284
receberam	264
calendário	217
à	106,255
“	162
”	137,190
melhores	103
fruto	39,109,331
Curta-metragem	367
feliz	115
concurso	27
gastronômica	241
10	188
Estou	113
com	94,279,297,309,315,342,344
Serviço	226
tantos	159
deu	128
Rodrigues	47
Veja	270
vez	120,126
segunda	119
é	85,166
"	112
dois	58
mil	65
faturaram	59
Pequiche	300
Micro	231
para	181
(	79,235
)	81,237
pequis	11,160
Hadassa	378
venceu	197
jovens	336
conquistou	52
,	44,130,138,173,176,191,248,358
-	287,301,319,352,377
.	40,56,66,82,110,116,142,161,170,193,238,259,268,339
Marcela	353
gostoso	172
também	100,222,326
\n	5,18,67,111,143,194,209,260,269,276,281,292,299,306,311,323,340,349,366,371,383
1,2	64
Oliveira	381
Ensino	347,362
Geraldo	303
Sebrae	236
que	121
já	165
jovem	20
roí	131
Gonçalves	7,22,146
:	14,203,275,373
se	179
os	102,262,271
Federal	89
roer	9,35,49,158
ou	295
Ser	163
primeira	125
Tocantins	91
26/11/2022	1,4
Fernando	6,21,145
Jesus	365
A	239
feitos	105,334
lugar	55
Tela	370
da	124,337,356
Salmão	282
R$	63
Morais	291
esforçar	180
de	28,30,32,62,97,157,219,228,257,285,290,304,313,317,361,380
grande	168
Freire	382
só	178
marca	150
agora	134
108	10,36,185
castanha	316
alunos	345
festival	325
dinheiro	267
disputa	240
evento	84
um	60
Os	57
Willian	320
vídeos	328
primeiro	54
faz	214
Gurupi	17,33,98,208,220
O	19,68,83,144,210,324
do	26,38,71,90,108,212,216,225,332,346,359
Espinhos	374
premiou	101,327
Francinalva	45,140,195
Ferreira	322
Sousa	305
Pequenas	233
diversificadas	254
Comidinha	293
base	107,256
vencedor	25
Márcia	302
elaboraram	252
segredo	156,169
Maria	289
contou	139,154,192
parceria	93
nova	149
não	127
prêmio	61
cozinheiros	251
nos	243
pequi	31,258,280,286,298,310,314,318,343
dias	244
Vídeos	341
chegar	183
Dias	355
competidores	263
apoio	224
conseguir	182
Ângela	288
a	95,118
2º	69
qualidade	174
23	245
conseguiu	8,48
24	247
ocorreu	242
minutos	189
teve	223
25	80
na	75,151,198,369
realizado	74,86
e	51,99,123,133,153,221,232,246,375
estabeleceu	147
Prefeitura	96
Pequi	72,171,213,350,368,372
Salgada	294
vencedores	272
Apoio	229
aos	184
feminina	43,200
cerrado	333
tocantinense	164,351
competição	152
Universidade	88
Foto	13,202
Pelizzari	205
48	132
foi	23,73,177
o	24,53,155,167,330
Pelizzari/Secom	16
64	50,136
categoria	42,199,274
caroços	37,186
parte	215
certo	129
Na	41
Salgado	278
boa	175
noite	76
Doçuras	376
quando	249
às	230
Secom	207
foram	135
participo	122
pratos	104
Bom	364
Centro	360
após	34
Silva	357
sobre	329
receitas	253
```

Examples
----------------------------------

In this example, the original text is restored using the token positions:

```bash
cat output.txt | gawk 'NR > 1 { split($2, POSITIONS, ","); for (i in POSITIONS) TOKENS[POSITIONS[i]] = $1 } END { for (i in TOKENS) printf "%s ", TOKENS[i] }' | fmt | head
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

