Fix Encoding
==================================

Description
----------------------------------

The `fix-encoding.awk` script fixes text originally encoded to UT-8 misunderstood as ISO-88591/Windows-1252 and then saved as UTF-8.

Usage:

    for i in `find folder/ -type f -name "*.txt"`; do ./fix-encoding.awk "$i" > "$i.tmp"; mv "$i.tmp" "$i"; done;
 
References:

 *  https://en.wikipedia.org/wiki/Windows-1252
 *  https://en.wikipedia.org/wiki/ISO/IEC_8859-1

