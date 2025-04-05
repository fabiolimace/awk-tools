Replace HTML Entities
==================================

Description
----------------------------------

The `replace-html-entities.awk` script replaces HTML entities with UTF-8 characters.

Usage:

    ./replace-html-entities.awk example.input.html > example.output.html

Demonstration
----------------------------------

In this example, the script processes a file containing emojis, flags and Windows-1252 characters in the form of HTML entities:

```
./replace-html-entities.awk example.input.html > example.output.html
```

The original input file contains:

```
<p>Emojis: &#x1F601; &#x1F602; &#x1F603;</p>

<p>National Flags: &#x1F1E7;&#x1F1F7; &#x1F1FF;&#x1F1FC; &#x1F1EE;&#x1F1F3;</p>

<p>Windows-1252 Characters: [&#x80; &#x82; &#x83; &#x84; &#x85; &#x86; &#x87; &#x88; &#x89; &#x8A; &#x8B; &#x8C; &#x8E; &#x91; &#x92; &#x93; &#x94; &#x95; &#x96; &#x97; &#x98; &#x99; &#x9A; &#x9B; &#x9C; &#x9E; &#x9F;]</p>
```

The generated output file contains:

```
<p>Emojis: 😁 😂 😃</p>

<p>National Flags: 🇧🇷 🇿🇼 🇮🇳</p>

<p>Windows-1252 Characters: [€ ‚ ƒ „ … † ‡ ˆ ‰ Š ‹ Œ Ž ‘ ’ “ ” • – — ˜ ™ š › œ ž Ÿ]</p>
```

