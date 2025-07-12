#!/usr/bin/awk -f
#
# Usage:
#
#     ./replace-html-entities.awk example.input.html > example.output.html
# 
# Author: Fabio Lima
# Date: 2023-04-23
#
# Repository: https://github.com/fabiolimace/awk-tools/
#

BEGIN {

# ASCII control chars
ASC["\\x09"]="\\x09"	# Horizontal Tabulation
ASC["\\x0A"]="\\x0A"	# Line Feed
ASC["\\x0D"]="\\x0D"	# Carriage Return

# Windows-1252 chars
WIN["\\x80"]="\\u20AC" 	# Euro
WIN["\\x82"]="\\u201A"	# Single low-9 quotation mark
WIN["\\x83"]="\\u0192"	# Lowercase with hook
WIN["\\x84"]="\\u201E"	# Double low-9 quotation mark
WIN["\\x85"]="\\u2026"	# Horizontal ellipsis
WIN["\\x86"]="\\u2020"	# Dagger
WIN["\\x87"]="\\u2021"	# Double dagger
WIN["\\x88"]="\\u02C6"	# Circumflex accent
WIN["\\x89"]="\\u2030"	# Per mille
WIN["\\x8A"]="\\u0160"	# Uppercase S with caron
WIN["\\x8B"]="\\u2039"	# Single left angle quotation
WIN["\\x8C"]="\\u0152"	# Uppercase ligature OE
WIN["\\x8E"]="\\u017D"	# Uppercase Z with caron
WIN["\\x91"]="\\u2018"	# Left single quotation mark
WIN["\\x92"]="\\u2019"	# Right single quotation mark
WIN["\\x93"]="\\u201C"	# Left double quotation mark
WIN["\\x94"]="\\u201D"	# Right double quotation mark
WIN["\\x95"]="\\u2022"	# Bullet
WIN["\\x96"]="\\u2013"	# En dash
WIN["\\x97"]="\\u2014"	# Em dash
WIN["\\x98"]="\\u02DC"	# Tilde
WIN["\\x99"]="\\u2122"	# Trademark
WIN["\\x9A"]="\\u0161"	# Lowercase s with caron
WIN["\\x9B"]="\\u203A"	# Single right angle quotation
WIN["\\x9C"]="\\u0153"	# Lowercase ligature oe
WIN["\\x9E"]="\\u017E"	# Lowercase x with caron
WIN["\\x9F"]="\\u0178"	# Capital Y with diaeres

# ASCII Characters
ENT["&quot;"]="\\u0022"	# Quotation mark
ENT["&amp;"]="\\u0026"	# Ampersand
ENT["&apos;"]="\\u0027"	# Apostrophe
ENT["&lt;"]="\\u003C"	# Less-than
ENT["&gt;"]="\\u003E"	# Greater than

# ISO-8859-1 Symbols
ENT["&nbsp;"]="\\u00A0"	# Non-breaking space
ENT["&iexcl;"]="\\u00A1"	# Inverted exclamation mark
ENT["&cent;"]="\\u00A2"	# Cent
ENT["&pound;"]="\\u00A3"	# Pound
ENT["&curren;"]="\\u00A4"	# Currency
ENT["&yen;"]="\\u00A5"	# Yen
ENT["&brvbar;"]="\\u00A6"	# Broken vertical bar
ENT["&sect;"]="\\u00A7"	# Section
ENT["&uml;"]="\\u00A8"	# Spacing diaeresis
ENT["&copy;"]="\\u00A9"	# Copyright
ENT["&ordf;"]="\\u00AA"	# Feminine ordinal indicator
ENT["&laquo;"]="\\u00AB"	# Opening/Left angle quotation mark
ENT["&not;"]="\\u00AC"	# Negation
ENT["&shy;"]="\\u00AD"	# Soft hyphen
ENT["&reg;"]="\\u00AE"	# Registered trademark
ENT["&macr;"]="\\u00AF"	# Spacing macron
ENT["&deg;"]="\\u00B0"	# Degree
ENT["&plusmn;"]="\\u00B1"	# Plus or minus
ENT["&sup2;"]="\\u00B2"	# Superscript 2
ENT["&sup3;"]="\\u00B3"	# Superscript 3
ENT["&acute;"]="\\u00B4"	# Spacing acute
ENT["&micro;"]="\\u00B5"	# Micro
ENT["&para;"]="\\u00B6"	# Paragraph
ENT["&middot;"]="\\u00B7"	# Middle dot
ENT["&cedil;"]="\\u00B8"	# Spacing cedilla
ENT["&sup1;"]="\\u00B9"	# Superscript 1
ENT["&ordm;"]="\\u00BA"	# Masculine ordinal indicator
ENT["&raquo;"]="\\u00BB"	# Closing/Right angle quotation mark
ENT["&frac14;"]="\\u00BC"	# Fraction 1/4
ENT["&frac12;"]="\\u00BD"	# Fraction 1/2
ENT["&frac34;"]="\\u00BE"	# Fraction 3/4
ENT["&iquest;"]="\\u00BF"	# Inverted question mark
ENT["&times;"]="\\u00D7"	# Multiplication
ENT["&divide;"]="\\u00F7"	# Divide

# ISO-8859-1 Letters
ENT["&Agrave;"]="\\u00C0"	# Capital a, grave accent
ENT["&Aacute;"]="\\u00C1"	# Capital a, acute accent
ENT["&Acirc;"]="\\u00C2"	# Capital a, circumflex accent
ENT["&Atilde;"]="\\u00C3"	# Capital a, tilde
ENT["&Auml;"]="\\u00C4"	# Capital a, umlaut mark
ENT["&Aring;"]="\\u00C5"	# Capital a, ring
ENT["&AElig;"]="\\u00C6"	# Capital ae
ENT["&Ccedil;"]="\\u00C7"	# Capital c, cedilla
ENT["&Egrave;"]="\\u00C8"	# Capital e, grave accent
ENT["&Eacute;"]="\\u00C9"	# Capital e, acute accent
ENT["&Ecirc;"]="\\u00CA"	# Capital e, circumflex accent
ENT["&Euml;"]="\\u00CB"	# Capital e, umlaut mark
ENT["&Igrave;"]="\\u00CC"	# Capital i, grave accent
ENT["&Iacute;"]="\\u00CD"	# Capital i, acute accent
ENT["&Icirc;"]="\\u00CE"	# Capital i, circumflex accent
ENT["&Iuml;"]="\\u00CF"	# Capital i, umlaut mark
ENT["&ETH;"]="\\u00D0"	# Capital eth, Icelandic
ENT["&Ntilde;"]="\\u00D1"	# Capital n, tilde
ENT["&Ograve;"]="\\u00D2"	# Capital o, grave accent
ENT["&Oacute;"]="\\u00D3"	# Capital o, acute accent
ENT["&Ocirc;"]="\\u00D4"	# Capital o, circumflex accent
ENT["&Otilde;"]="\\u00D5"	# Capital o, tilde
ENT["&Ouml;"]="\\u00D6"	# Capital o, umlaut mark
ENT["&Oslash;"]="\\u00D8"	# Capital o, slash
ENT["&Ugrave;"]="\\u00D9"	# Capital u, grave accent
ENT["&Uacute;"]="\\u00DA"	# Capital u, acute accent
ENT["&Ucirc;"]="\\u00DB"	# Capital u, circumflex accent
ENT["&Uuml;"]="\\u00DC"	# Capital u, umlaut mark
ENT["&Yacute;"]="\\u00DD"	# Capital y, acute accent
ENT["&THORN;"]="\\u00DE"	# Capital THORN, Icelandic
ENT["&szlig;"]="\\u00DF"	# Small sharp s, German
ENT["&agrave;"]="\\u00E0"	# Small a, grave accent
ENT["&aacute;"]="\\u00E1"	# Small a, acute accent
ENT["&acirc;"]="\\u00E2"	# Small a, circumflex accent
ENT["&atilde;"]="\\u00E3"	# Small a, tilde
ENT["&auml;"]="\\u00E4"	# Small a, umlaut mark
ENT["&aring;"]="\\u00E5"	# Small a, ring
ENT["&aelig;"]="\\u00E6"	# Small ae
ENT["&ccedil;"]="\\u00E7"	# Small c, cedilla
ENT["&egrave;"]="\\u00E8"	# Small e, grave accent
ENT["&eacute;"]="\\u00E9"	# Small e, acute accent
ENT["&ecirc;"]="\\u00EA"	# Small e, circumflex accent
ENT["&euml;"]="\\u00EB"	# Small e, umlaut mark
ENT["&igrave;"]="\\u00EC"	# Small i, grave accent
ENT["&iacute;"]="\\u00ED"	# Small i, acute accent
ENT["&icirc;"]="\\u00EE"	# Small i, circumflex accent
ENT["&iuml;"]="\\u00EF"	# Small i, umlaut mark
ENT["&eth;"]="\\u00F0"	# Small eth, Icelandic
ENT["&ntilde;"]="\\u00F1"	# Small n, tilde
ENT["&ograve;"]="\\u00F2"	# Small o, grave accent
ENT["&oacute;"]="\\u00F3"	# Small o, acute accent
ENT["&ocirc;"]="\\u00F4"	# Small o, circumflex accent
ENT["&otilde;"]="\\u00F5"	# Small o, tilde
ENT["&ouml;"]="\\u00F6"	# Small o, umlaut mark
ENT["&oslash;"]="\\u00F8"	# Small o, slash
ENT["&ugrave;"]="\\u00F9"	# Small u, grave accent
ENT["&uacute;"]="\\u00FA"	# Small u, acute accent
ENT["&ucirc;"]="\\u00FB"	# Small u, circumflex accent
ENT["&uuml;"]="\\u00FC"	# Small u, umlaut mark
ENT["&yacute;"]="\\u00FD"	# Small y, acute accent
ENT["&thorn;"]="\\u00FE"	# Small thorn, Icelandic
ENT["&yuml;"]="\\u00FF"	# Small y, umlaut mark

# Miscellaneous HTML entities
ENT["&OElig;"]="\\u0152"	# Uppercase ligature OE
ENT["&oelig;"]="\\u0153"	# Lowercase ligature oe
ENT["&Scaron;"]="\\u0160"	# Uppercase S with caron
ENT["&scaron;"]="\\u0161"	# Lowercase s with caron
ENT["&Yuml;"]="\\u0178"	# Capital Y with diaeres
ENT["&fnof;"]="\\u0192"	# Lowercase with hook
ENT["&circ;"]="\\u02C6"	# Circumflex accent
ENT["&tilde;"]="\\u02DC"	# Tilde
ENT["&ensp;"]="\\u2002"	# En space
ENT["&emsp;"]="\\u2003"	# Em space
ENT["&thinsp;"]="\\u2009"	# Thin space
ENT["&zwnj;"]="\\u200C"	# Zero width non-joiner
ENT["&zwj;"]="\\u200D"	# Zero width joiner
ENT["&lrm;"]="\\u200E"	# Left-to-right mark
ENT["&rlm;"]="\\u200F"	# Right-to-left mark
ENT["&ndash;"]="\\u2013"	# En dash
ENT["&mdash;"]="\\u2014"	# Em dash
ENT["&lsquo;"]="\\u2018"	# Left single quotation mark
ENT["&rsquo;"]="\\u2019"	# Right single quotation mark
ENT["&sbquo;"]="\\u201A"	# Single low-9 quotation mark
ENT["&ldquo;"]="\\u201C"	# Left double quotation mark
ENT["&rdquo;"]="\\u201D"	# Right double quotation mark
ENT["&bdquo;"]="\\u201E"	# Double low-9 quotation mark
ENT["&dagger;"]="\\u2020"	# Dagger
ENT["&Dagger;"]="\\u2021"	# Double dagger
ENT["&bull;"]="\\u2022"	# Bullet
ENT["&hellip;"]="\\u2026"	# Horizontal ellipsis
ENT["&permil;"]="\\u2030"	# Per mille
ENT["&prime;"]="\\u2032"	# Minutes (Degrees)
ENT["&Prime;"]="\\u2033"	# Seconds (Degrees)
ENT["&lsaquo;"]="\\u2039"	# Single left angle quotation
ENT["&rsaquo;"]="\\u203A"	# Single right angle quotation
ENT["&oline;"]="\\u203E"	# Overline
ENT["&frasl;"]="\\u2044"	# Fraction slash
ENT["&euro;"]="\\u20AC"	# Euro
ENT["&trade;"]="\\u2122"	# Trademark
ENT["&alefsym;"]="\\u2135"	# Alef symbol
ENT["&larr;"]="\\u2190"	# Left arrow
ENT["&uarr;"]="\\u2191"	# Up arrow
ENT["&rarr;"]="\\u2192"	# Right arrow
ENT["&darr;"]="\\u2193"	# Down arrow
ENT["&harr;"]="\\u2194"	# Left right arrow
ENT["&crarr;"]="\\u21B5"	# Carriage return arrow
ENT["&lceil;"]="\\u2308"	# Left ceiling
ENT["&rceil;"]="\\u2309"	# Right ceiling
ENT["&lfloor;"]="\\u230A"	# Left floor
ENT["&rfloor;"]="\\u230B"	# Right floor
ENT["&loz;"]="\\u25CA"	# Lozenge
ENT["&spades;"]="\\u2660"	# Spade
ENT["&clubs;"]="\\u2663"	# Club
ENT["&hearts;"]="\\u2665"	# Heart
ENT["&diams;"]="\\u2666"	# Diamond

# Greek Letters
ENT["&Alpha;"]="\\u0391"	# Alpha
ENT["&Beta;"]="\\u0392"	# Beta
ENT["&Gamma;"]="\\u0393"	# Gamma
ENT["&Delta;"]="\\u0394"	# Delta
ENT["&Epsilon;"]="\\u0395"	# Epsilon
ENT["&Zeta;"]="\\u0396"	# Zeta
ENT["&Eta;"]="\\u0397"	# Eta
ENT["&Theta;"]="\\u0398"	# Theta
ENT["&Iota;"]="\\u0399"	# Iota
ENT["&Kappa;"]="\\u039A"	# Kappa
ENT["&Lambda;"]="\\u039B"	# Lambda
ENT["&Mu;"]="\\u039C"	# Mu
ENT["&Nu;"]="\\u039D"	# Nu
ENT["&Xi;"]="\\u039E"	# Xi
ENT["&Omicron;"]="\\u039F"	# Omicron
ENT["&Pi;"]="\\u03A0"	# Pi
ENT["&Rho;"]="\\u03A1"	# Rho
ENT["&Sigma;"]="\\u03A3"	# Sigma
ENT["&Tau;"]="\\u03A4"	# Tau
ENT["&Upsilon;"]="\\u03A5"	# Upsilon
ENT["&Phi;"]="\\u03A6"	# Phi
ENT["&Chi;"]="\\u03A7"	# Chi
ENT["&Psi;"]="\\u03A8"	# Psi
ENT["&Omega;"]="\\u03A9"	# Omega
ENT["&alpha;"]="\\u03B1"	# alpha
ENT["&beta;"]="\\u03B2"	# beta
ENT["&gamma;"]="\\u03B3"	# gamma
ENT["&delta;"]="\\u03B4"	# delta
ENT["&epsilon;"]="\\u03B5"	# epsilon
ENT["&zeta;"]="\\u03B6"	# zeta
ENT["&eta;"]="\\u03B7"	# eta
ENT["&theta;"]="\\u03B8"	# theta
ENT["&iota;"]="\\u03B9"	# iota
ENT["&kappa;"]="\\u03BA"	# kappa
ENT["&lambda;"]="\\u03BB"	# lambda
ENT["&mu;"]="\\u03BC"	# mu
ENT["&nu;"]="\\u03BD"	# nu
ENT["&xi;"]="\\u03BE"	# xi
ENT["&omicron;"]="\\u03BF"	# omicron
ENT["&pi;"]="\\u03C0"	# pi
ENT["&rho;"]="\\u03C1"	# rho
ENT["&sigmaf;"]="\\u03C2"	# sigmaf
ENT["&sigma;"]="\\u03C3"	# sigma
ENT["&tau;"]="\\u03C4"	# tau
ENT["&upsilon;"]="\\u03C5"	# upsilon
ENT["&phi;"]="\\u03C6"	# phi
ENT["&chi;"]="\\u03C7"	# chi
ENT["&psi;"]="\\u03C8"	# psi
ENT["&omega;"]="\\u03C9"	# omega
ENT["&thetasym;"]="\\u03D1"	# Theta symbol
ENT["&upsih;"]="\\u03D2"	# Upsilon symbol
ENT["&piv;"]="\\u03D6"	# Pi symbol

# Math Symbols
ENT["&forall;"]="\\u2200"	# For all
ENT["&part;"]="\\u2202"	# Part
ENT["&exist;"]="\\u2203"	# Exist
ENT["&empty;"]="\\u2205"	# Empty
ENT["&nabla;"]="\\u2207"	# Nabla
ENT["&isin;"]="\\u2208"	# Is in
ENT["&notin;"]="\\u2209"	# Not in
ENT["&ni;"]="\\u220B"	# Ni
ENT["&prod;"]="\\u220F"	# Product
ENT["&sum;"]="\\u2211"	# Sum
ENT["&minus;"]="\\u2212"	# Minus
ENT["&lowast;"]="\\u2217"	# Asterisk (Lowast)
ENT["&radic;"]="\\u221A"	# Square root
ENT["&prop;"]="\\u221D"	# Proportional to
ENT["&infin;"]="\\u221E"	# Infinity
ENT["&ang;"]="\\u2220"	# Angle
ENT["&and;"]="\\u2227"	# And
ENT["&or;"]="\\u2228"	# Or
ENT["&cap;"]="\\u2229"	# Cap
ENT["&cup;"]="\\u222A"	# Cup
ENT["&int;"]="\\u222B"	# Integral
ENT["&there4;"]="\\u2234"	# Therefore
ENT["&sim;"]="\\u223C"	# Similar to
ENT["&cong;"]="\\u2245"	# Congurent to
ENT["&asymp;"]="\\u2248"	# Almost equal
ENT["&ne;"]="\\u2260"	# Not equal
ENT["&equiv;"]="\\u2261"	# Equivalent
ENT["&le;"]="\\u2264"	# Less or equal
ENT["&ge;"]="\\u2265"	# Greater or equal
ENT["&sub;"]="\\u2282"	# Subset of
ENT["&sup;"]="\\u2283"	# Superset of
ENT["&nsub;"]="\\u2284"	# Not subset of
ENT["&sube;"]="\\u2286"	# Subset or equal
ENT["&supe;"]="\\u2287"	# Superset or equal
ENT["&oplus;"]="\\u2295"	# Circled plus
ENT["&otimes;"]="\\u2297"	# Circled times
ENT["&perp;"]="\\u22A5"	# Perpendicular
ENT["&sdot;"]="\\u22C5"	# Dot operator

}

function substitute(ent) {
    
    # Numeric Reference
    if (ent ~ "&#x?[0-9a-fA-F]+;") {
    
        # Code: FFFFFFFF
        if (ent ~ "x") {
            code = substr(ent, 4, length(ent) - 4);
            code = sprintf("%8s", code);
            code = toupper(code);
            gsub(" ", "0", code);
        } else {
            code = substr(ent, 3, length(ent) - 3);
            code = sprintf("%08X",code);
        }
        
        # ASCII control characters
        if (code ~ "^000000[0-1][0-9A-F]$") {
            # allow only HT, LF, CR
            sub("^.{6}","", code);
            return ASC["\\x"code];
        }
        
        # ISO-8859-1 control characters
        if (code ~ "^000000[8-9][0-9A-F]$") {
            # replace with Unicode
            sub("^.{6}","", code);
            return WIN["\\x"code];
        }
        
        # Unicode format: \UFFFFFFFF
        # Upper U required by PRINTF
        return "\\U"code;
    }
    
    # Char Reference
    return ENT[ent];
}

/&[^;]+;/ {
    do {
        # change the current line
        beg = match($0, "&[^;]+;");
        if (beg > 0) {
            str = substr($0, beg);
            end = index(str, ";");
            ent = substr($0, beg, end);
            gsub(ent, substitute(ent));
            continue;
        }
        break;
    } while (1);
}

{
    # append current line
    output=output $0 "\\n";
}

END {
    # escape percent char
    gsub("%", "%%", output);
    
    # System PRINTF for \uFFFF \UFFFFFFFF
    # AWK's PRINTF don't support Unicode
    system("/usr/bin/printf '"output"'");
}

