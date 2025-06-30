Sort Except Header
==================================

Description
----------------------------------

Sort file, except its header.

Use `-v SORT_ARGS=` to pass arguments to `sort`.

Usage:

    awk -f sort-except-header.awk input.txt > output.txt
    awk -v SORT_ARGS="-n" -f sort-except-header.awk input.txt > output.txt

Reference: https://unix.stackexchange.com/questions/11856/

Demonstration
----------------------------------

Example:

```bash
awk -f sort-except-header.awk input.txt > output.txt
```

Input text:

```
HEADER
impressora
sabe-se
criada
ri
abordagem
monitorando
basta
hepática
talento
```

Output text:

```
HEADER
abordagem
basta
criada
hepática
impressora
monitorando
ri
sabe-se
talento
```

