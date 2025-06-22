Word Counter
==================================

Description
----------------------------------

This script counts words, calculating absolute frequency, and relative frequency.
 
It produces an TSV file with the following fields:
 
 1. TOKEN: the token, i.e. a "word".
 2. COUNT: the token's absolute frequency, i.e. the number of occurrences of a token.
 3. RATIO: the token's relative frequency, i.e. the number of occurrences of a token divided by the total number of tokens.

Usage:

    gawk -f word-counter.awk input.txt > output.txt
    gawk -f word-spacer.awk input.txt | gawk -f word-counter.awk - > output.txt

This script only works with GNU's Awk (gawk).

Demonstration
----------------------------------

In this example, the script processes [a text from G1](https://g1.globo.com/to/tocantins/quiz/jovem-consegue-roer-108-pequis-em-dez-minutos-e-vence-concurso-durante-festival-em-gurupi.ghtml).

```bash
gawk -f word-spacer.awk input.txt | gawk -f word-counter.awk - > output.txt
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
TOKEN	COUNT	RATIO
premiações	1	0.002610966
É	1	0.002610966
Doce	2	0.005221932
pela	1	0.002610966
Atualizado	1	0.002610966
ao	1	0.002610966
cultural	1	0.002610966
sexta-feira	1	0.002610966
desta	1	0.002610966
uma	1	0.002610966
Festival	2	0.005221932
Todos	1	0.002610966
Prato	2	0.005221932
Brasileiro	1	0.002610966
muito	1	0.002610966
Empresas	1	0.002610966
Médio	2	0.005221932
Gomes	1	0.002610966
–	1	0.002610966
roedor	1	0.002610966
—	2	0.005221932
Borges	1	0.002610966
Manjar	1	0.002610966
em	3	0.007832898
Barros	3	0.007832898
por	2	0.005221932
vários	1	0.002610966
cidade	1	0.002610966
11h33	1	0.002610966
Raquel	1	0.002610966
Ricardo	2	0.005221932
molho	1	0.002610966
receberam	1	0.002610966
calendário	1	0.002610966
à	2	0.005221932
“	1	0.002610966
”	2	0.005221932
melhores	1	0.002610966
fruto	3	0.007832898
Curta-metragem	1	0.002610966
feliz	1	0.002610966
concurso	1	0.002610966
gastronômica	1	0.002610966
10	1	0.002610966
Estou	1	0.002610966
com	7	0.018276762
Serviço	1	0.002610966
tantos	1	0.002610966
deu	1	0.002610966
Rodrigues	1	0.002610966
Veja	1	0.002610966
vez	2	0.005221932
segunda	1	0.002610966
é	2	0.005221932
"	1	0.002610966
dois	1	0.002610966
mil	1	0.002610966
faturaram	1	0.002610966
Pequiche	1	0.002610966
Micro	1	0.002610966
para	1	0.002610966
(	2	0.005221932
)	2	0.005221932
pequis	2	0.005221932
Hadassa	1	0.002610966
venceu	1	0.002610966
jovens	1	0.002610966
conquistou	1	0.002610966
,	8	0.020887728
-	5	0.013054830
.	14	0.036553525
Marcela	1	0.002610966
gostoso	1	0.002610966
também	3	0.007832898
\n	21	0.054830287
1,2	1	0.002610966
Oliveira	1	0.002610966
Ensino	2	0.005221932
Geraldo	1	0.002610966
Sebrae	1	0.002610966
que	1	0.002610966
já	1	0.002610966
jovem	1	0.002610966
roí	1	0.002610966
Gonçalves	3	0.007832898
:	4	0.010443864
se	1	0.002610966
os	3	0.007832898
Federal	1	0.002610966
roer	4	0.010443864
ou	1	0.002610966
Ser	1	0.002610966
primeira	1	0.002610966
Tocantins	1	0.002610966
26/11/2022	2	0.005221932
Fernando	3	0.007832898
Jesus	1	0.002610966
A	1	0.002610966
feitos	2	0.005221932
lugar	1	0.002610966
Tela	1	0.002610966
da	3	0.007832898
Salmão	1	0.002610966
R$	1	0.002610966
Morais	1	0.002610966
esforçar	1	0.002610966
de	16	0.041775457
grande	1	0.002610966
Freire	1	0.002610966
só	1	0.002610966
marca	1	0.002610966
agora	1	0.002610966
108	3	0.007832898
castanha	1	0.002610966
alunos	1	0.002610966
festival	1	0.002610966
dinheiro	1	0.002610966
disputa	1	0.002610966
evento	1	0.002610966
um	1	0.002610966
Os	1	0.002610966
Willian	1	0.002610966
vídeos	1	0.002610966
primeiro	1	0.002610966
faz	1	0.002610966
Gurupi	5	0.013054830
O	6	0.015665796
do	11	0.028720627
Espinhos	1	0.002610966
premiou	2	0.005221932
Francinalva	3	0.007832898
Ferreira	1	0.002610966
Sousa	1	0.002610966
Pequenas	1	0.002610966
diversificadas	1	0.002610966
Comidinha	1	0.002610966
base	2	0.005221932
vencedor	1	0.002610966
Márcia	1	0.002610966
elaboraram	1	0.002610966
segredo	2	0.005221932
Maria	1	0.002610966
contou	3	0.007832898
parceria	1	0.002610966
nova	1	0.002610966
não	1	0.002610966
prêmio	1	0.002610966
cozinheiros	1	0.002610966
nos	1	0.002610966
pequi	9	0.023498695
dias	1	0.002610966
Vídeos	1	0.002610966
chegar	1	0.002610966
Dias	1	0.002610966
competidores	1	0.002610966
apoio	1	0.002610966
conseguir	1	0.002610966
Ângela	1	0.002610966
a	2	0.005221932
2º	1	0.002610966
qualidade	1	0.002610966
23	1	0.002610966
conseguiu	2	0.005221932
24	1	0.002610966
ocorreu	1	0.002610966
minutos	1	0.002610966
teve	1	0.002610966
25	1	0.002610966
na	4	0.010443864
realizado	2	0.005221932
e	9	0.023498695
estabeleceu	1	0.002610966
Prefeitura	1	0.002610966
Pequi	6	0.015665796
Salgada	1	0.002610966
vencedores	1	0.002610966
Apoio	1	0.002610966
aos	1	0.002610966
feminina	2	0.005221932
cerrado	1	0.002610966
tocantinense	2	0.005221932
competição	1	0.002610966
Universidade	1	0.002610966
Foto	2	0.005221932
Pelizzari	1	0.002610966
48	1	0.002610966
foi	3	0.007832898
o	5	0.013054830
Pelizzari/Secom	1	0.002610966
64	2	0.005221932
categoria	3	0.007832898
caroços	2	0.005221932
parte	1	0.002610966
certo	1	0.002610966
Na	1	0.002610966
Salgado	1	0.002610966
boa	1	0.002610966
noite	1	0.002610966
Doçuras	1	0.002610966
quando	1	0.002610966
às	1	0.002610966
Secom	1	0.002610966
foram	1	0.002610966
participo	1	0.002610966
pratos	1	0.002610966
Bom	1	0.002610966
Centro	1	0.002610966
após	1	0.002610966
Silva	1	0.002610966
sobre	1	0.002610966
receitas	1	0.002610966
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

