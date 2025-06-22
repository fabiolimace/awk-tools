Word Formats
==================================

Description
----------------------------------

This script detects the format of each word of a text.

It produces an TSV file with the following fields:

 1. TOKEN: the token, i.e. a "word".
 2. FORMAT: the token's format..

Use `-v CUSTOM_FORMATS=KEY1:REGEX1;KEY2:REGEX2;` to push a list of custom formats.

A custom format has a key and a regex separated by a colon. A list of custom formats has its itens separated by semicolons.

Usage:

    gawk -f word-formats.awk input.txt > output.txt
    gawk -f word-spacer.awk input.txt | gawk -f word-formats.awk > output.txt

This script only works with GNU's Awk (gawk).

Demonstration
----------------------------------

In this example, the script processes [a text from G1](https://g1.globo.com/to/tocantins/quiz/jovem-consegue-roer-108-pequis-em-dez-minutos-e-vence-concurso-durante-festival-em-gurupi.ghtml).

```bash
gawk -f word-spacer.awk input.txt | gawk -f word-formats.awk - > output.txt
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
TOKEN	FORMAT
premiações	L
É	U
Doce	C
pela	L
Atualizado	C
ao	L
cultural	L
sexta-feira	LH
desta	L
uma	L
Festival	C
Todos	C
Prato	C
Brasileiro	C
muito	L
Empresas	C
Médio	C
Gomes	C
–	NA
roedor	L
—	NA
Borges	C
Manjar	C
em	L
Barros	C
por	L
vários	L
cidade	L
11h33	TH
Raquel	C
Ricardo	C
molho	L
receberam	L
calendário	L
à	L
“	NA
”	NA
melhores	L
fruto	L
Curta-metragem	CH
feliz	L
concurso	L
gastronômica	L
10	N
Estou	C
com	L
Serviço	C
tantos	L
deu	L
Rodrigues	C
Veja	C
vez	L
segunda	L
é	L
"	NA
dois	L
mil	L
faturaram	L
Pequiche	C
Micro	C
para	L
(	NA
)	NA
pequis	L
Hadassa	C
venceu	L
jovens	L
conquistou	L
,	NA
-	NA
.	NA
Marcela	C
gostoso	L
também	L
1,2	NC
Oliveira	C
Ensino	C
Geraldo	C
Sebrae	C
que	L
já	L
jovem	L
roí	L
Gonçalves	C
:	NA
se	L
os	L
Federal	C
roer	L
ou	L
Ser	C
primeira	L
Tocantins	C
26/11/2022	D
Fernando	C
Jesus	C
A	U
feitos	L
lugar	L
Tela	C
da	L
Salmão	C
R$	NA
Morais	C
esforçar	L
de	L
grande	L
Freire	C
só	L
marca	L
agora	L
108	N
castanha	L
alunos	L
festival	L
dinheiro	L
disputa	L
evento	L
um	L
Os	C
Willian	C
vídeos	L
primeiro	L
faz	L
Gurupi	C
O	U
do	L
Espinhos	C
premiou	L
Francinalva	C
Ferreira	C
Sousa	C
Pequenas	C
diversificadas	L
Comidinha	C
base	L
vencedor	L
Márcia	C
elaboraram	L
segredo	L
Maria	C
contou	L
parceria	L
nova	L
não	L
prêmio	L
cozinheiros	L
nos	L
pequi	L
dias	L
Vídeos	C
chegar	L
Dias	C
competidores	L
apoio	L
conseguir	L
Ângela	C
a	L
2º	NA
qualidade	L
23	N
conseguiu	L
24	N
ocorreu	L
minutos	L
teve	L
25	N
na	L
realizado	L
e	L
estabeleceu	L
Prefeitura	C
Pequi	C
Salgada	C
vencedores	L
Apoio	C
aos	L
feminina	L
cerrado	L
tocantinense	L
competição	L
Universidade	C
Foto	C
Pelizzari	C
48	N
foi	L
o	L
Pelizzari/Secom	NA
64	N
categoria	L
caroços	L
parte	L
certo	L
Na	C
Salgado	C
boa	L
noite	L
Doçuras	C
quando	L
às	L
Secom	C
foram	L
participo	L
pratos	L
Bom	C
Centro	C
após	L
Silva	C
sobre	L
receitas	L
```

