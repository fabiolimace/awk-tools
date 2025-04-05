Join Numbers
==================================

Description
----------------------------------

The `join-numbers.awk` script joins numeric tokens with AWK.

Demonstration
----------------------------------

This example joins the telefone numbers and the number of soldiers.

```
cat | awk -f join-numbers.awk text.txt

Meu telefone é 85 988887777.

Meu telefone é (85) 98888-7777.

Na guerra morreram 1 500 soldados.

CTRL+D
```

```
Meu telefone é 85988887777.

Meu telefone é (85)98888-7777.

Na guerra morreram 1500 soldados.
```

