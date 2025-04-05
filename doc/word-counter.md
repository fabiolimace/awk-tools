Word Counter
==================================

Description
----------------------------------

The `word-counter.awk` script counts words in texts, calculating word frequence, relative frequence and more.

Demonstration
----------------------------------

In this example, the script processes [a text from G1](https://g1.globo.com/to/tocantins/quiz/jovem-consegue-roer-108-pequis-em-dez-minutos-e-vence-concurso-durante-festival-em-gurupi.ghtml).

```bash
awk -f `word-counter.awk` input.txt > output.txt
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

This is the output, formatted by `column` util:

```
cat input.txt | column --table
```
```
TOKEN            COUNT  RATIO        CLASS  STYLE  LENGH  POSITIONS
premiações       1      0.002816901  A      L      10     255
É                1      0.002816901  A      U      1      113
Doce             2      0.005633803  A      C      4      281,290
pela             1      0.002816901  A      L      4      84
Atualizado       1      0.002816901  A      C      10     3
ao               1      0.002816901  A      L      2      270
cultural         1      0.002816901  A      L      8      209
sexta-feira      1      0.002816901  A      L      11     75
desta            1      0.002816901  A      L      5      74
uma              1      0.002816901  A      L      3      143
Festival         2      0.005633803  A      C      8      67,202
Todos            1      0.002816901  A      C      5      251
Prato            2      0.005633803  A      C      5      265,289
Brasileiro       1      0.002816901  A      C      10     218
muito            1      0.002816901  A      L      5      110
Empresas         1      0.002816901  A      C      8      225
Médio            2      0.005633803  A      C      5      326,339
Gomes            1      0.002816901  A      C      5      301
roedor           1      0.002816901  A      L      6      26
Borges           1      0.002816901  A      C      6      330
Manjar           1      0.002816901  A      C      6      293
em               3      0.008450704  A      L      2      89,182,256
Barros           3      0.008450704  A      C      6      43,137,190
por              2      0.005633803  A      L      3      262,314
vários           1      0.002816901  A      L      6      241
cidade           1      0.002816901  A      L      6      317
11h33            1      0.002816901  NA     NA     5      2
Raquel           1      0.002816901  A      C      6      352
Ricardo          2      0.005633803  A      C      7      13,197
molho            1      0.002816901  A      L      5      271
receberam        1      0.002816901  A      L      9      254
calendário       1      0.002816901  A      L      10     208
à                2      0.005633803  A      L      1      103,246
“                1      0.002816901  P      NA     1      157
”                2      0.005633803  P      NA     1      133,185
melhores         1      0.002816901  A      L      8      100
fruto            3      0.008450704  A      L      5      36,106,310
Curta-metragem   1      0.002816901  A      C      14     342
feliz            1      0.002816901  A      L      5      111
concurso         1      0.002816901  A      L      8      24
gastronômica     1      0.002816901  A      L      12     232
10               1      0.002816901  D      NA     2      183
Estou            1      0.002816901  A      C      5      109
com              7      0.019718310  A      L      3      91,267,282,291,296,320,322
Serviço          1      0.002816901  A      C      7      217
tantos           1      0.002816901  A      L      6      154
deu              1      0.002816901  A      L      3      124
Rodrigues        1      0.002816901  A      C      9      44
Veja             1      0.002816901  A      C      4      259
vez              2      0.005633803  A      L      3      116,122
segunda          1      0.002816901  A      L      7      115
é                2      0.005633803  A      L      1      82,161
"                1      0.002816901  P      NA     1      108
dois             1      0.002816901  A      L      4      55
mil              1      0.002816901  A      L      3      63
faturaram        1      0.002816901  A      L      9      56
Pequiche         1      0.002816901  A      C      8      284
$                1      0.002816901  P      NA     1      61
Micro            1      0.002816901  A      C      5      222
para             1      0.002816901  A      L      4      176
(                2      0.005633803  P      NA     1      76,226
)                2      0.005633803  P      NA     1      78,228
pequis           2      0.005633803  A      L      6      10,155
Hadassa          1      0.002816901  A      C      7      351
venceu           1      0.002816901  A      L      6      191
jovens           1      0.002816901  A      L      6      315
,                8      0.022535211  P      NA     1      41,126,134,168,171,186,239,334
conquistou       1      0.002816901  A      L      10     49
.                14     0.039436620  P      NA     1      37,53,64,79,107,112,138,156,165,188,229,250,258,318
Marcela          1      0.002816901  A      C      7      329
gostoso          1      0.002816901  A      L      7      167
também           3      0.008450704  A      L      6      97,213,305
1,2              1      0.002816901  NA     NA     3      62
Oliveira         1      0.002816901  A      C      8      354
Ensino           2      0.005633803  A      C      6      325,338
Geraldo          1      0.002816901  A      C      7      286
Sebrae           1      0.002816901  A      C      6      227
que              1      0.002816901  A      L      3      117
já               1      0.002816901  A      L      2      160
jovem            1      0.002816901  A      L      5      17
roí              1      0.002816901  A      L      3      127
Gonçalves        3      0.008450704  A      C      9      6,19,141
:                4      0.011267606  P      NA     1      12,196,264,347
se               1      0.002816901  A      L      2      174
os               3      0.008450704  A      L      2      99,252,260
Federal          1      0.002816901  A      C      7      86
roer             4      0.011267606  A      L      4      8,32,46,153
ou               1      0.002816901  A      L      2      280
Ser              1      0.002816901  A      C      3      158
primeira         1      0.002816901  A      L      8      121
Tocantins        1      0.002816901  A      C      9      88
26/11/2022       2      0.005633803  NA     NA     10     1,4
Fernando         3      0.008450704  A      C      8      5,18,140
Jesus            1      0.002816901  A      C      5      341
A                1      0.002816901  A      U      1      230
feitos           2      0.005633803  A      L      6      102,313
lugar            1      0.002816901  A      L      5      52
Tela             1      0.002816901  A      C      4      345
da               3      0.008450704  A      L      2      120,316,332
Salmão           1      0.002816901  A      C      6      269
Morais           1      0.002816901  A      C      6      277
esforçar         1      0.002816901  A      L      8      175
de               16     0.045070423  A      L      2      25,27,29,59,94,152,210,219,248,272,276,287,294,298,337,353
grande           1      0.002816901  A      L      6      163
Freire           1      0.002816901  A      C      6      355
só               1      0.002816901  A      L      2      173
marca            1      0.002816901  A      L      5      145
agora            1      0.002816901  A      L      5      130
108              3      0.008450704  D      NA     3      9,33,180
castanha         1      0.002816901  A      L      8      297
alunos           1      0.002816901  A      L      6      323
festival         1      0.002816901  A      L      8      304
dinheiro         1      0.002816901  A      L      8      257
disputa          1      0.002816901  A      L      7      231
evento           1      0.002816901  A      L      6      81
um               1      0.002816901  A      L      2      57
Os               1      0.002816901  A      C      2      54
Willian          1      0.002816901  A      C      7      300
vídeos           1      0.002816901  A      L      6      307
primeiro         1      0.002816901  A      L      8      51
faz              1      0.002816901  A      L      3      205
Gurupi           5      0.014084507  A      C      6      15,30,95,200,211
O                6      0.016901408  A      U      1      16,65,80,139,201,303
do               11     0.030985915  A      L      2      23,35,68,87,105,203,207,216,311,324,335
Espinhos         1      0.002816901  A      C      8      348
premiou          2      0.005633803  A      L      7      98,306
Francinalva      3      0.008450704  A      C      11     42,136,189
Ferreira         1      0.002816901  A      C      8      302
Sousa            1      0.002816901  A      C      5      288
R                1      0.002816901  A      U      1      60
Pequenas         1      0.002816901  A      C      8      224
diversificadas   1      0.002816901  A      L      14     245
Comidinha        1      0.002816901  A      C      9      278
base             2      0.005633803  A      L      4      104,247
vencedor         1      0.002816901  A      L      8      22
Márcia           1      0.002816901  A      C      6      285
elaboraram       1      0.002816901  A      L      10     243
segredo          2      0.005633803  A      L      7      151,164
Maria            1      0.002816901  A      C      5      275
contou           3      0.008450704  A      L      6      135,149,187
parceria         1      0.002816901  A      L      8      90
nova             1      0.002816901  A      L      4      144
não              1      0.002816901  A      L      3      123
prêmio           1      0.002816901  A      L      6      58
cozinheiros      1      0.002816901  A      L      11     242
nos              1      0.002816901  A      L      3      234
pequi            9      0.025352113  A      L      5      28,249,268,273,283,292,295,299,321
dias             1      0.002816901  A      L      4      235
Vídeos           1      0.002816901  A      C      6      319
chegar           1      0.002816901  A      L      6      178
Dias             1      0.002816901  A      C      4      331
competidores     1      0.002816901  A      L      12     253
apoio            1      0.002816901  A      L      5      215
conseguir        1      0.002816901  A      L      9      177
Ângela           1      0.002816901  A      C      6      274
a                2      0.005633803  A      L      1      92,114
2º               1      0.002816901  NA     NA     2      66
qualidade        1      0.002816901  A      L      9      169
23               1      0.002816901  D      NA     2      236
conseguiu        2      0.005633803  A      L      9      7,45
24               1      0.002816901  D      NA     2      238
ocorreu          1      0.002816901  A      L      7      233
minutos          1      0.002816901  A      L      7      184
teve             1      0.002816901  A      L      4      214
25               1      0.002816901  D      NA     2      77
na               4      0.011267606  A      L      2      72,146,192,344
realizado        2      0.005633803  A      L      9      71,83
e                9      0.025352113  A      L      1      48,96,119,129,148,212,223,237,349
estabeleceu      1      0.002816901  A      L      11     142
Prefeitura       1      0.002816901  A      C      10     93
Pequi            6      0.016901408  A      C      5      69,166,204,327,343,346
Salgada          1      0.002816901  A      C      7      279
vencedores       1      0.002816901  A      L      10     261
Apoio            1      0.002816901  A      C      5      220
aos              1      0.002816901  A      L      3      179
feminina         2      0.005633803  A      L      8      40,194
cerrado          1      0.002816901  A      L      7      312
tocantinense     2      0.005633803  A      L      12     159,328
competição       1      0.002816901  A      L      10     147
Universidade     1      0.002816901  A      C      12     85
Foto             2      0.005633803  A      C      4      11,195
Pelizzari        1      0.002816901  A      C      9      198
48               1      0.002816901  D      NA     2      128
foi              3      0.008450704  A      L      3      20,70,172
o                5      0.014084507  A      L      1      21,50,150,162,309
Pelizzari/Secom  1      0.002816901  NA     NA     15     14
64               2      0.005633803  D      NA     2      47,132
categoria        3      0.008450704  A      L      9      39,193,263
caroços          2      0.005633803  A      L      7      34,181
parte            1      0.002816901  A      L      5      206
certo            1      0.002816901  A      L      5      125
Na               1      0.002816901  A      C      2      38
Salgado          1      0.002816901  A      C      7      266
boa              1      0.002816901  A      L      3      170
noite            1      0.002816901  A      L      5      73
Doçuras          1      0.002816901  A      C      7      350
quando           1      0.002816901  A      L      6      240
às               1      0.002816901  A      L      2      221
Secom            1      0.002816901  A      C      5      199
foram            1      0.002816901  A      L      5      131
participo        1      0.002816901  A      L      9      118
pratos           1      0.002816901  A      L      6      101
Bom              1      0.002816901  A      C      3      340
Centro           1      0.002816901  A      C      6      336
após             1      0.002816901  A      L      4      31
Silva            1      0.002816901  A      C      5      333
sobre            1      0.002816901  A      L      5      308
receitas         1      0.002816901  A      L      8      244
```
