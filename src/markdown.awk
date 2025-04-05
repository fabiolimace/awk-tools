#!/usr/bin/awk -f
#
# Usage:
#
# ./markdown.awk test.md > test.html
# 
# Author: Fabio Lima
# Date: 2023-05-16
#

BEGIN {

    # Separate fields using a single whitespace.
    # We don't want the default special case of `FS=" "` because
    # We use `$1` to recognize lines started with `### `, `- ` etc.
    FS="[ ]";

    indent=0;
    locked="";
    
    flags[0] = 0;
    
    qwot=0;
    lizt=0;
    ol[0] = 0
    ul[0] = 0
    
    output = "";
    current = "";
    
    links[0] = 0;
    linkstitles[0] = 0;
    
    escapes="\\`*_{}[]<>()#+-.!";
    
    NL="\n"
    BLANK="^[ ]*$";
    INDENT="^[ ]{4}";
    LISTITEM="^[ ]*([\\*\\+-]|[0-9]+\\.)[ ]+";
    
    # stackoverflow.com/questions/2499270
    for(n=0;n<256;n++)ord[sprintf("%c",n)]=n
    for(n=0;n<256;n++)chr[n]=sprintf("%c",n)
    
    style=style ":root {\n";
    style=style "  --gray: #efefef;\n";
    style=style "  --black: #444;\n";
    style=style "  --dark-gray: #aaaaaa;\n";
    style=style "  --light-gray: #fafafa;\n";
    style=style "  --light-blue: #0969da;\n";
    style=style "  --light-yellow: #fafaaa;\n";
    style=style "}\n";
    style=style "html {\n";
    style=style "  font-size: 16px;\n";
    style=style "  max-width: 100%;\n";
    style=style "}\n";
    style=style "body {\n";
    style=style "  padding: 1rem;\n";
    style=style "  margin: 0 auto;\n";
    style=style "  max-width: 50rem;\n";
    style=style "  line-height: 1.8;\n";
    style=style "  font-family: sans-serif;\n";
    style=style "  color: var(--black);\n";
    style=style "}\n";
    style=style "p {\n";
    style=style "  font-size: 1rem;\n";
    style=style "  margin-bottom: 1.3rem;\n";
    style=style "}\n";
    style=style "a, a:visited { color: var(--black); }\n";
    style=style "a:hover, a:focus, a:active { color: var(--light-blue); }\n";
    style=style "h1 { font-size: 3rem; }\n";
    style=style "h2 { font-size: 2.1rem; }\n";
    style=style "h3 { font-size: 1.6rem; }\n";
    style=style "h4 { font-size: 1.4rem; }\n";
    style=style "h5 { font-size: 1.2rem; }\n";
    style=style "h6{ font-size: 1rem; }\n";
    style=style "h1, h2, h3 {\n";
    style=style "  padding-bottom: 0.5rem;\n";
    style=style "  border-bottom: 2px solid var(--gray);\n";
    style=style "}\n";
    style=style "h1, h2, h3, h4, h5, h6 {\n";
    style=style "  line-height: 1.4;\n";
    style=style "  font-weight: inherit;\n";
    style=style "  margin: 1.4rem 0 .5rem;\n";
    style=style "}\n";
    style=style "pre {\n";
    style=style "  padding: 1rem;\n";
    style=style "  overflow-x:auto;\n";
    style=style "  line-height: 1.5;\n";
    style=style "  border-radius: .4rem;\n";
    style=style "  font-family: monospace;\n";
    style=style "  border: 1px solid var(--dark-gray);\n";
    style=style "  background-color: var(--gray);\n";
    style=style "}\n";
    style=style "code {\n";
    style=style "  padding: 0.3rem;\n";
    style=style "  border-radius: .2rem;\n";
    style=style "  font-family: monospace;\n";
    style=style "  background-color: var(--gray);\n";
    style=style "}\n";
    style=style "mark {\n";
    style=style "  padding: 0.3rem;\n";
    style=style "  border-radius: .2rem;\n";
    style=style "  background-color: var(--light-yellow);\n";
    style=style "}\n";
    style=style "blockquote {\n";
    style=style "  margin: 1.5rem;\n";
    style=style "  padding: 1rem;\n";
    style=style "  border-radius: .4rem;\n";
    style=style "  background-color: var(--light-gray);\n";
    style=style "  border-left: 12px solid var(--gray);\n";
    style=style "}\n";
    style=style "hr { border: 2px solid var(--gray); }\n";
    style=style "img { height: auto; max-width: 100%; }\n";
    style=style "table { border-collapse: collapse; margin-bottom: 1.3rem; }\n";
    style=style "th { padding: .7rem; border-bottom: 1px solid var(--black);}\n";
    style=style "td { padding: .7rem; border-bottom: 1px solid var(--gray);}\n";
}

function out(line) {
    output = output line;
}

function flag(key, value) {
    if (key) {
        flags[key] = value;
    } else {
        for (key in flags) {
            flags[key] = 0;
        }
    }
}

function quotelevel(level) {
    while (qwot < level) {
        qwot++;
        out(sprintf("\n<%s>\n", "blockquote"));
    }

    while (qwot > level) {
        qwot--;
        out(sprintf("\n</%s>\n", "blockquote"));
    }
}

function listlevel(tag, level) {
    
    while (lizt < level) {
        lizt++;
        if (tag == "ol") {
            ol[lizt] = 1;
        } else {
            ul[lizt] = 1;
        }
        out(sprintf("\n<%s>\n", tag));
    }

    while (lizt > level) {
        if (ol[lizt]) {
            ol[lizt] = 0;
            out(sprintf("\n</%s>\n", "ol"));
        }
        if (ul[lizt]) {
            ul[lizt] = 0;
            out(sprintf("\n</%s>\n", "ul"));
        }
        lizt--;
    }
}

function parseline(text) {

    # order is important
    text=parseimages(text);
    text=parselinks(text);
    text=parsecode(text);
    text=parsestrike(text);
    text=parsebolditalic(text);
    text=parsebold(text);
    text=parseitalic(text);
    text=parsebreak(text);
    text=parsecheck(text);
    
    return text;
}

function parsecode(text) {
    text = parseformat(text, "``", "<code>", "</code>", 1);
    text = parseformat(text, "`", "<code>", "</code>", 1);
    return text;
}

function parsestrike(text) {
    text = parseformat(text, "~~", "<del>", "</del>");
    return text;
}

function parsebolditalic(text) {
    text = parseformat(text, "***", "<strong><em>", "</em></strong>");
    text = parseformat(text, "___", "<strong><em>", "</em></strong>");
    return text;
}

function parsebold(text) {
    text = parseformat(text, "**", "<strong>", "</strong>");
    text = parseformat(text, "__", "<strong>", "</strong>");
    return text;
}

function parseitalic(text) {
    text = parseformat(text, "*", "<em>", "</em>");
    text = parseformat(text, "_", "<em>", "</em>");
    return text;
}

# this function also works with paragraphs broken into more than one line
# a flag sings that a close tag from a line must be prepended in the next line
function parseformat(text, chars, otag , ctag, escape,     i, n, arr, tag, fieldsep, result) {

    if (!text) {
        return text;
    }

    # open & close
    tag[0] = otag;
    tag[1] = ctag;

    if (flags[chars]) {
        flag(chars, 0); # now complete the previous line
        text = chars text; # then to prepend a open tag
    }
    
    # escape asterisk
    fieldsep = chars;
    gsub("*", "\\*", fieldsep);
    
    n = split(text, arr, fieldsep); # try to split to get an even even of separators
    if (!(n % 2)) {
        # odd number!
        flag(chars, 1); # to be completed in the next line
        text = text chars; # first append a close tag here to force an odd number
        n = split(text, arr, fieldsep); # split again to get even number of separators
    }
    
    result = arr[1]
    for (i = 2; i <= n; i++) {
    
        # between tags
        if (!(i % 2)) {
        
            if (arr[i] == "") {
                # remove previous open tag
                # and ignore empty string
                sub(chars"$", "", result);
                continue;
            }
        
            if (escape) {
                # if <code>, escape certain chars
                arr[i] = codeescape(arr[i], escape);
            }
        }
        result = result tag[(i % 2)] arr[i];
    }
    
    return result;
}

function parseimages(text,     arr, src, alt, title) {
    
    # Pattern: [Name](http:example.com "Title")
    while ( match(text, "^(.*)[!]\\[([^\\]]+)\\]\\(([^\\) ]+)([ ]+\"([^\"]+)\")?\\)(.*)?$", arr) ) {
        if (arr[0]) {
            alt = " alt=\"" arr[2] "\"";
            src = " src=\"" urlencode(arr[3]) "\"";
            if (arr[4] && arr[5]) title = " title=\"" arr[5] "\""; else title = "";
            text = arr[1] "<img" src alt title ">" arr[6];
        } else {
            break;
        }
    }
    
    return text;
}

function parselinks(text,     arr, href, label, title, img) {

    # Pattern: <https://example.com>
    while( match(text, "^(.*)<(https?://[^>]+)>(.*)$", arr) ) {
        if (arr[0]) {
            label = arr[2]
            href = " href=\"" urlencode(arr[2]) "\"";
            text = arr[1] "<a" href ">" label "</a>" arr[3];
        } else {
            break;
        }
    }
    
    # Pattern: <fake@example.com>
    while( match(text, "^(.*)<([a-z0-9\\._-]+@[^>]+)>(.*)$", arr) ) {
        if (arr[0]) {
            label = arr[2]
            href = " href=\"mailto:" urlencode(arr[2]) "\"";
            text = arr[1] "<a" href ">" label "</a>" arr[3];
        } else {
            break;
        }
    }
    
    # Pattern 1: [Name](http:example.com "Title")
    # Pattern 2: [<img>](http:example.com "Title")
    # the order is important to recognize links with images: 1. parseimage(), 2. parselinks()
    while ( match(text, "^(.*)[^!]?\\[([^\\]]+)\\]\\(([^\\) ]+)([ ]+\"([^\"]+)\")?\\)(.*)$", arr) ) {
        if (arr[0]) {
            label = arr[2]
            href = " href=\"" urlencode(arr[3]) "\"";
            if (arr[4] && arr[5]) title = " title=\"" arr[5] "\""; else title = "";
            text = arr[1] "<a" href title ">" label "</a>" arr[6];
        } else {
            break;
        }
    }
    
    return text;
}

function extractreflinks(text,     arr, ref, link, title) {
    
    # Pattern: [Label]: http:example.com "Title"
    if ( match(text, "^[ ]*\\[([^\\]]+)\\]:[ ]+<?([^ >]+)>?([ ]+\"([^\"]+)\")?$", arr) ) {
        if (arr[0]) {
            ref = arr[1];
            link = arr[2]
            title = arr[4]
            reflinks[ref] = link;
            reftitles[ref] = title;
        }
    }
}

function replacereflinks(text,   tag, ref, href, label, title) {

    while ( match(text, "^(.*)\\[([^]]+)\\]\\[([^]]+)\\](.*)$", arr) ) {
        if (arr[0]) {
            ref = arr[3];
            if (reflinks[ref]) {
                label = arr[2];
                href = " href=\"" urlencode(reflinks[ref]) "\"";
                if (reftitles[ref]) {
                    title = " title=\"" reftitles[ref] "\"";
                } else { 
                    title = "";
                }
                text = arr[1] "<a" href title ">" label "</a>" arr[4];
            } else {
                text = arr[1] "<a href=\"#\" style=\"color: red;\">" label "</a>" arr[4];
            }
            
        } else {
            break;
        }
    }
    
    while ( match(text, "^(.*)\\[([^]]+)\\](.*)$", arr) ) {
        if (arr[0]) {
            ref = arr[2];
            if (reflinks[ref]) {
                href = " href=\"" urlencode(reflinks[ref]) "\"";
                if (reftitles[ref]) {
                    title = " title=\"" reftitles[ref] "\"";
                } else { 
                    title = "";
                }
                text = arr[1] "<a" href title ">" ref "</a>" arr[3];
            } else {
                text = arr[1] "<a href=\"#\" style=\"color: red;\">" ref "</a>" arr[3];
            }
        } else {
            break;
        }
    }
    
    return text;
}

# encode underscore to avoid
# confusion with italic char
function urlencode(text) {
    gsub("_", ("%5F"), text);
    return text;
}

function parsebreak(text) {
    # if it ends 2 spaces
    if (text ~ /([ ]{2,}|\\)$/) {
        # replace them with <br>
        sub(/([ ]{2,}|\\)$/, "<br>", text);
    }
    return text;
}

function parsecheck(text,   arr, regex, checked, checkbox) {
    # if it starts with []
    regex = "^ *\\[([xX ]?)\\] *";
    if (text ~ regex) {
        match(text, regex, arr);
        if (arr[1] ~ /[xX]/) {
            checked = "checked=\"checked\"";
        } else {
            checked = "";
        }
        # replace them with <input type="checkbox">
        checkbox = "<input type=\"checkbox\" disabled readonly " checked ">\n";
        sub(regex, checkbox, text);
    }
    return text;
}

function codeescape(text, esc,      i, n, arr, result) {
    if (esc) {
        n = split(text, arr, "");
        for (i = 1; i <= n; i++) {
            if (escapable(arr[i])) {
                result = result escape(arr[i]);
            } else {
                result = result arr[i];
            }
        }
        return result;
    }
    return text;
}

function backslashescape(text,    i, n, arr, result) {
    n = split(text, arr, "");
    for (i = 1; i <= n; i++) {
        if (arr[i] == "\\" && escapable(arr[i+1])) {
            result = result escape(arr[++i]);
        } else {
            result = result arr[i];
        }
    }
    return result;
}

function escapable(char) {
    return char && index(escapes, char);
}

function escape(char) {
    return "&#" ord[char] ";";
}

function outtag(tag, content, attributes) {
    opentag(tag, attributes);
    out(content);
    closetag(tag);
}

function opentag(tag, attributes,      name, attr) {
    for (name in attributes) {
        attr = attr " " name "=\"" attributes[name] "\"";
    }
    out("\n<" tag attr ">\n");
}

function closetag(tag) {
    out("\n</" tag ">\n");
}

function parsetablerow(text, tag,   i, n, arr, cell, align, style, result) {

    n = split(text, arr, "\\|");
    
    # 1st line with 3 dashes after the header
    if (text ~ /\|[ :-]*-{3,}[ :-]*\|/) {
        # parse columns alignment
        for (i = 2; i <= n - 1; i++) {
            if (arr[i] ~ ":-{3,}[^:]") {
                flag(("td" i), "left");
            } else if (arr[i] ~ ":-{3,}:") {
                flag(("td" i), "center");
            } else if (arr[i] ~ "[^:]-{3,}:") {
                flag(("td" i), "right");
            }
        }
        return; # now skip this line
    }
    
    result = "<tr>\n";
    for (i = 2; i <= n - 1; i++) {
        
        cell = arr[i];
        sub("^ +", "", cell);
        sub(" +$", "", cell);
        cell = parseline(cell);
        align = flags[("td" i)];
        
        if (align) {
            style = " style=\"text-align: " align ";\"";
        }
        
        result = result "<" tag style ">" cell "</" tag ">" "\n";
    }

    result = result "</tr>\n";
    
    return result;
}

function countquotelevel(    level, temp) {

    while ($0 ~ /^[ \t]*>[ \t]?/) {
        sub(/^[ \t]*>[ \t]?/, "", $0);
    }

    temp = current;
    while (temp ~ /^[ \t]*>[ \t]?/) {
        level++;
        sub(/^[ \t]*>[ \t]?/, "", temp);
    }
    
    if (locked && level < qwot) {
        # continuing lazy blockquote
        # in the next line after `>`
    } else {
        quotelevel(level);
    }
}

function nextline(   result) {
    endline();
    result = (getline > 0);
    beginline();
    return result;
}

function beginline() {
    current = $0;
    countquotelevel();
    if ($0 ~ /\\/) {
        $0=backslashescape($0);
    }
}

function endline() {
    flag();
    countquotelevel();
    if (!locked) {
        updatelistindent(0);
    }
}

{
    beginline();
}

#------------------------------------------------
# Things for which leading spaces are important
#------------------------------------------------



# remove leading spaces from $0
function removeleadingspaces() {
    while ($0 ~ /^[ ]+/) {
        sub(/^[ ]+/, "", $0);
    }
}

function updatelistindent(start,     line, indent) {

    line = $0;
    indent = start;
    while (line ~ INDENT) {
        indent++;
        sub(INDENT, "", line);
    }
    
    if (line ~ /[ ]*[\*\+-][ ]+/) {
        listlevel("ul", indent);
    } else {
        listlevel("ol", indent);
    }
}

# list item
$0 ~ LISTITEM {

    updatelistindent(1);
    
    locked="li";
    opentag("li");
    sub(LISTITEM, "", $0);
    out(parseline($0));
    
    while (getline) {

        # check blank line
        if ($0 ~ BLANK) {
            break;
        }
        
        # check other item
        if ($0 ~ LISTITEM) {
            closetag("li");
            
            updatelistindent(1);
            
            opentag("li");
            sub(LISTITEM, "", $0);
            out(parseline($0));
        } else {
            out(NL);
            sub(LISTITEM, "", $0);
            out(parseline($0));
        }
    }
    
    closetag("li");
    locked = "";
    updatelistindent(0);
#    endline();
    next;
}

# code block
$0 ~ INDENT {

    locked="pre";
    opentag("pre");
    
    sub(INDENT, "", $0);
    out(codeescape($0, 1));

    while (getline) {
        if ($0 ~ /^$/) {
            break;
        }
        sub(INDENT, "", $0);
        out(codeescape(NL $0, 1));
    }
    
    closetag("pre");
    locked = "";
    endline();
    next;
}

#------------------------------------------------
# Things that don't care about leading spaces
#------------------------------------------------

{
    # remove leading spaces
    while ($0 ~ /^[ \t]+/) {
        sub(/^[ \t]+/, "", $0);
    }
}

# fenced code block
$1 ~ "^`{3,}" {
    
    nl="";
    opentag("pre");
    
    sub($1 FS "?", "", $0);
    if ($0 !~ "^$") {
        out(codeescape($0, 1));
        nl="\n";
    }
    
    while (nextline()) {
        if ($1 !~ "^`{3,}") {
            out(codeescape(nl $0, 1));
            nl="\n";
        } else {
            break;
        }
    }
    
    closetag("pre");
    next;
}

# table
/^\|/ {

    opentag("table");
    out(parsetablerow($0, "th"));
    
    while (nextline()) {
        # empty/blank line
        if ($0 ~ /^[ ]*$/) {
            break;
        }
        out(parsetablerow($0, "td"));
    }
    closetag("table");
    
    next;
}

# reference style links
/^\[[^\]]+\]:[ ]+/ {
    extractreflinks($0);
    next;
}

# horizontal rule
/^(={3,}|-{3,}|_{3,}|\*{3,})$/ {
    opentag("hr");
    next;
}

# headings 1..6
$1 ~ "^#{1,6}$" {

    n = length($1);
    if (n > 6) n = 6;
    
    heading = $0;
    sub($1 FS, "", heading);
    heading = parseline(heading);
    
    split("", attr);
    attr["id"] = heading;
    outtag("h" n, heading, attr);
    
    next;
}

# paragraph
/^.+$/ {

    firstline=parseline($0);

    # add form feeds
    # they are used to support
    # headings with `=` or `-`
    out("\f");
    opentag("p");
    out("\f");
    out(firstline);
    
    locked="p";
    while (nextline()) {

        if (firstline) {
        
            # detect headings followed by 1 "=" or "-"
            if (output ~ /\f/ && $0 ~ /^(=+|-+)[ ]*$/) {
            
                n = 1;
                if ($0 ~ /^-/) n = 2;
                
                # split using form feeds
                split(output, arr, "\f");
                output = arr[1];
                firstline = arr[3];
                
                split("", attr);
                attr["id"] = firstline;
                outtag("h" n, firstline, attr);
                next;
            }
        }
        firstline = "";

        # empty/blank line
        if ($0 ~ BLANK) {
            break;
        }
        out("\n" parseline($0));
    }
    
    # remove form feeds
    gsub("\f", "", output);
    closetag("p");
    
    locked = "";
    endline();
    next;
}

{
    endline();
}

END {
    endline();
    
    output = replacereflinks(output);
    
    printf("<!DOCTYPE html>\n");
    printf("<head>\n");
    printf("<style>\n");
    printf("%s", style);
    printf("</style>\n");
    printf("</head>\n");
    printf("<body>\n");
    
    printf("%s", output);
    
    printf("</body>\n");
    printf("</html>\n");
}
