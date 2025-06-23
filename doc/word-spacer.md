Word Spacer
==================================

Description
----------------------------------

This script inserts spaces between words and punctuation.

Example:

 *  Input:  `This is... a '(very)' ('especial') example!`
 *  Output: `This is ... a ' ( very ) ' ( ' especial ' ) example !`

The output is useful for tokenization.

Usage:

    gawk -f word-spacer.awk input.txt > output.txt

This script only works with GNU's Awk (gawk).

Demonstration
----------------------------------

In this example, the script processes [a text from G1](https://g1.globo.com/to/tocantins/quiz/jovem-consegue-roer-108-pequis-em-dez-minutos-e-vence-concurso-durante-festival-em-gurupi.ghtml).

```bash
gawk -f word-spacer.awk input.txt > output.txt 
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
26/11/2022 11h33 Atualizado 26/11/2022
Fernando Gonçalves conseguiu roer 108 pequis — Foto : Ricardo Pelizzari/Secom Gurupi
O jovem Fernando Gonçalves foi o vencedor do concurso de roedor de pequi de Gurupi após roer 108 caroços do fruto . Na categoria feminina , Francinalva Barros Rodrigues conseguiu roer 64 e conquistou o primeiro lugar . Os dois faturaram um prêmio de R$ 1,2 mil .
O 2º Festival do Pequi foi realizado na noite desta sexta-feira ( 25 ) . O evento é realizado pela Universidade Federal do Tocantins em parceria com a Prefeitura de Gurupi e também premiou os melhores pratos feitos à base do fruto .
" Estou muito feliz . É a segunda vez que participo e da primeira vez não deu certo , roí 48 e agora foram 64 ” , contou Francinalva Barros .
O Fernando Gonçalves estabeleceu uma nova marca na competição e contou o segredo de roer tantos pequis . “ Ser tocantinense já é o grande segredo . Pequi gostoso , qualidade boa , foi só se esforçar para conseguir chegar aos 108 caroços em 10 minutos ” , contou .
Francinalva Barros venceu na categoria feminina — Foto : Ricardo Pelizzari – Secom Gurupi
O Festival do Pequi faz parte do calendário cultural de Gurupi e também teve apoio do Serviço Brasileiro de Apoio às Micro e Pequenas Empresas ( Sebrae ) . A disputa gastronômica ocorreu nos dias 23 e 24 , quando vários cozinheiros elaboraram receitas diversificadas à base de pequi .
Todos os competidores receberam premiações em dinheiro .
Veja os vencedores por categoria :
Prato Salgado com pequi
Salmão ao molho de pequi - Ângela Maria de Morais
Comidinha Salgada ou Doce com pequi
Pequiche - Márcia Geraldo de Sousa
Prato Doce com pequi
Manjar de pequi com castanha de pequi - Willian Gomes Ferreira
O festival também premiou vídeos sobre o fruto do cerrado feitos por jovens da cidade .
Vídeos com pequi com alunos do Ensino Médio
Pequi tocantinense - Marcela Borges Dias da Silva , do Centro de Ensino Médio Bom Jesus
Curta-metragem Pequi na Tela
Pequi : Espinhos e Doçuras - Hadassa Raquel de Oliveira Freire
```

