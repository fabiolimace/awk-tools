Line Breaker
==================================

Description
----------------------------------

Breaks lines greater than a certain number of characters.

It is useful for software that has a limit of characters per line, for example, `espeak-ng` v1.51.

In `espeak-ng` when the limit is trespassed, the phrase pronunciation is interrupted, sometimes in the middle of a word.

This script tries to break the line in the most convenient place for `espeak-ng`, which is in the end of a phrase.

Usage:

    awk -f line-breaker.awk input.txt

Use the parameter MAX_LENGTH to set the maximum number of characters per line. The default is 1000, the same as in espeak-ng.

