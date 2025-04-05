Record-Jar
==================================

Descriptio
----------------------------------


The `record-jar` script converts Record-Jar formatted files to other formats such as CSV and JSON.

The Record-Jar Format is defined in The Art of Unix Programming, by Eric S. Raymond.

Usage:

    ./record-jar.awk -v "FORMAT=csv" planets.txt

Parameters:

 *  FORMAT: one of these values: `csv`, `ssv`, `psv`, `tsv`, `json`. The default format is `csv`.
 *  DIALECT: one of these values: `classic`, `recutils`. The default is `classic` (as defined by Eric S. Raymond).
 *  OFFSET: the number of records to be skipped; The default value is zero. Useful for pagination. Also useful for IANA's some registry files (`OFFSET=1`).
 *  LIMIT: the maximum number of records to be returned; The default value is 2147483647 (2^31-1). Useful for pagination.

Notes:

 *   For CSV, SSV, PSV or TSV, multivalue fields are represented in a colon-separated values list.
 *   For JSON, multivalue fields are represented in a JSON array.

Warning: invalid lines are silently ignored.

Read:

 *  OpenJR: https://openrj.sourceforge.net
 *  Alhadis' Record-Jar: https://github.com/Alhadis/Record-Jar
 *  IETF Draft: https://datatracker.ietf.org/doc/html/draft-phillips-record-jar-02
 *  Classic Record-Jar Format: http://www.catb.org/esr/writings/taoup/html/ch05s02.html#id2906931
 *  Parsing Record Jar Formatted Files: https://filebox.ece.vt.edu/~ece2524/reading/record_jar/index.html
 *  IANA subtag registry: https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry
 *  IANA tag extensions registry: https://www.iana.org/assignments/language-tag-extensions-registry/language-tag-extensions-registry

Demonstration
----------------------------------

Examples with `planets.txt`:

```bash
./record-jar.awk -v "FORMAT=csv" planets.txt 
```
```
"Planet","Orbital-Radius","Diameter","Eccentricity","Mass","Moons"
"Mercury","57,910,000 km","4,880 km","0.2","3.30e23 kg",""
"Venus","108,200,000 km","12,103.6 km","0.007","4.869e24 kg",""
"Earth","149,600,000 km","12,756.3 km","0.0167","5.972e24 kg","Luna"
"Jupiter","778,000,000 km","142,984 km","0.0489","1.8982e27 kg","Callisto:Europa:Io:Ganymede"
```
```bash
./record-jar.awk -v "FORMAT=ssv" planets.txt 
```
```
"Planet";"Orbital-Radius";"Diameter";"Eccentricity";"Mass";"Moons"
"Mercury";"57,910,000 km";"4,880 km";"0.2";"3.30e23 kg";""
"Venus";"108,200,000 km";"12,103.6 km";"0.007";"4.869e24 kg";""
"Earth";"149,600,000 km";"12,756.3 km";"0.0167";"5.972e24 kg";"Luna"
"Jupiter";"778,000,000 km";"142,984 km";"0.0489";"1.8982e27 kg";"Callisto:Europa:Io:Ganymede"
```
```bash
./record-jar.awk -v "FORMAT=psv" planets.txt
```
```
Planet|Orbital-Radius|Diameter|Eccentricity|Mass|Moons
Mercury|57,910,000 km|4,880 km|0.2|3.30e23 kg|
Venus|108,200,000 km|12,103.6 km|0.007|4.869e24 kg|
Earth|149,600,000 km|12,756.3 km|0.0167|5.972e24 kg|Luna
Jupiter|778,000,000 km|142,984 km|0.0489|1.8982e27 kg|Callisto:Europa:Io:Ganymede
```
```bash
./record-jar.awk -v "FORMAT=tsv" planets.txt 
```
```
Planet	Orbital-Radius	Diameter	Eccentricity	Mass	Moons
Mercury	57,910,000 km	4,880 km	0.2	3.30e23 kg	
Venus	108,200,000 km	12,103.6 km	0.007	4.869e24 kg	
Earth	149,600,000 km	12,756.3 km	0.0167	5.972e24 kg	Luna
Jupiter	778,000,000 km	142,984 km	0.0489	1.8982e27 kg	Callisto:Europa:Io:Ganymede
```
```bash
./record-jar.awk -v "FORMAT=json" planets.txt 
```
```json
[
  {
    "Planet": "Mercury",
    "Orbital-Radius": "57,910,000 km",
    "Diameter": "4,880 km",
    "Eccentricity": "0.2",
    "Mass": "3.30e23 kg"
  },
  {
    "Planet": "Venus",
    "Orbital-Radius": "108,200,000 km",
    "Diameter": "12,103.6 km",
    "Eccentricity": "0.007",
    "Mass": "4.869e24 kg"
  },
  {
    "Planet": "Earth",
    "Orbital-Radius": "149,600,000 km",
    "Diameter": "12,756.3 km",
    "Eccentricity": "0.0167",
    "Mass": "5.972e24 kg",
    "Moons": "Luna"
  },
  {
    "Planet": "Jupiter",
    "Orbital-Radius": "778,000,000 km",
    "Diameter": "142,984 km",
    "Eccentricity": "0.0489",
    "Mass": "1.8982e27 kg",
    "Moons": ["Callisto", "Europa", "Io", "Ganymede"]
  }
]
```

------------------------------------

Example with `books.txt` and `DIALECT=recutils`:

```bash
./record-jar.awk -v "FORMAT=json" -v "DIALECT=recutils" books.txt
```
```json
[
  {
    "Title": "Engenharia de software na prática",
    "Author": "Hélio Engholm Jr.",
    "Category": "Tecnologia da Informação"
  },
  {
    "Title": "Qualidade de software",
    "Author": "André Koscianski",
    "Category": "Tecnologia da Informação"
  },
  {
    "Title": "Fundamentos do gerenciamento de serviços de TI",
    "Author": "Marcos André dos Santos Freitas",
    "Category": "Tecnologia da Informação"
  },
  {
    "Title": "Engenharia de Software",
    "Author": "Ian Sommervile",
    "Category": ["Tecnologia da Informação", "Engenharia de Software"]
  }
]
```

Example with `books.txt`, `DIALECT=recutils`, `OFFSET=1` and `LIMIT=2`:

```bash
./record-jar.awk -v "FORMAT=json" -v "DIALECT=recutils" -v "OFFSET=1" -v "LIMIT=2" books.txt
```
```json
[
  {
    "Title": "Qualidade de software",
    "Author": "André Koscianski",
    "Category": "Tecnologia da Informação"
  },
  {
    "Title": "Fundamentos do gerenciamento de serviços de TI",
    "Author": "Marcos André dos Santos Freitas",
    "Category": "Tecnologia da Informação"
  }
]
```

------------------------------------

Example with `iana.txt` and `OFFSET=1` (to skip the first lines):

```bash
./record-jar.awk -v "FORMAT=json" -v "OFFSET=1" iana.txt
```
```json
[
  {
    "Identifier": "t",
    "Description": "Specifying Transformed Content",
    "Comments": "Subtags for the identification of content that has been transformed, including but not limited to: transliteration, transcription, and translation.",
    "Added": "2011-12-16",
    "RFC": "[RFC6497]",
    "Authority": "Unicode Consortium",
    "URL": "http://www.unicode.org/Public/cldr/latest/core.zip"
  },
  {
    "Identifier": "u",
    "Description": "Unicode Locale",
    "Comments": "Subtags for the identification of language and cultural variations. Used to set behavior in locale APIs. Data is located in the \"common/bcp47\" directory inside the referenced URL. Unicode Technical Standard #35 (LDML) provides additional reference material defining the keys and values. For more details please see <http://cldr.unicode.org/index/bcp47-extension>.",
    "Added": "2010-09-02",
    "RFC": "[RFC6067]",
    "Authority": "Unicode Consortium",
    "URL": "http://www.unicode.org/Public/cldr/latest/core.zip"
  }
]
```

Appendix
----------------------------------

Contents of `books.txt`:

```
# Record-Jar dialect: recutils

Title: Engenharia de software na prática
Author: Hélio Engholm Jr.
Category: Tecnologia da Informação

Title: Qualidade de software
Author: André Koscianski
Category: Tecnologia da Informação

Title: Engenharia de Software
Author: Ian Sommervile
Category: Tecnologia da Informação

Title: Fundamentos do gerenciamento
+                 de serviços de TI
Author: Marcos André dos Santos Freitas
Category: Tecnologia da Informação
Category: Engenharia de Software

```

Contents of `iana.txt`:

```
File-Date: 2014-04-02
%%
Identifier: t
Description: Specifying Transformed Content
Comments: Subtags for the identification of content that has been
  transformed, including but not limited to:
  transliteration, transcription, and translation.
Added: 2011-12-16
RFC: [RFC6497]
Authority: Unicode Consortium
Contact_Email: cldr-contact&unicode.org
Mailing_List: cldr-users&unicode.org
URL: http://www.unicode.org/Public/cldr/latest/core.zip
%%
Identifier: u
Description: Unicode Locale
Comments: Subtags for the identification of language and cultural \
  variations. Used to set behavior in locale APIs. Data is located in \
  the "common/bcp47" directory inside the referenced URL. Unicode \
  Technical Standard #35 (LDML) provides additional reference material \
  defining the keys and values. For more details please see \
  <http://cldr.unicode.org/index/bcp47-extension>.
Added: 2010-09-02
RFC: [RFC6067]
Authority: Unicode Consortium
Contact_Email: cldr-contact&unicode.org
Mailing_List: cldr-users&unicode.org
URL: http://www.unicode.org/Public/cldr/latest/core.zip
%%
```

Contents of `planets.txt`:

```
Planet: Mercury
Orbital-Radius: 57,910,000 km
Diameter: 4,880 km
Eccentricity: 0.2
Mass: 3.30e23 kg
%%
Planet: Venus
Orbital-Radius: 108,200,000 km
Diameter: 12,103.6 km
Eccentricity: 0.007
Mass: 4.869e24 kg
%%
Planet: Earth
Orbital-Radius: 149,600,000 km
Diameter: 12,756.3 km
Eccentricity: 0.0167
Mass: 5.972e24 kg
Moons: Luna
%%
Planet: Jupiter
Orbital-Radius: 778,000,000 km
Diameter: 142,984 km
Eccentricity: 0.0489
Mass: 1.8982e27 kg 
Moons: Callisto
Moons: Europa
Moons: Io
Moons: Ganymede
```

Contents of `the-art-of-unix-programming.md` (for preservation):

```
The Art of Unix Programming
================================================

Copyright &copy; 2003 Eric S. Raymond.

Chapter 5. Textuality
------------------------------------------------

### Data File Metaformats

URL: <http://www.catb.org/esr/writings/taoup/html/ch05s02.html#id2906931>

A data file metaformat is a set of syntactic and lexical conventions that is either formally standardized or sufficiently well established by practice that there are standard service libraries to handle marshaling and unmarshaling it.

Unix has evolved or adopted metaformats suitable for a wide range of applications. It is good practice to use one of these (rather than an idiosyncratic custom format) wherever possible. The benefits begin with the amount of custom parsing and generation code that you may be able to avoid writing by using a service library. But the most important benefit is that developers and even many users will instantly recognize these formats and feel comfortable with them, which reduces the friction costs of learning new programs.

In the following discussion, when we refer to “traditional Unix tools” we are intending the combination of grep(1), sed(1), awk(1), tr(1), and cut(1) for doing text searches and transformations. Perl and other scripting languages tend to have good native support for parsing the line-oriented formats that these tools encourage.

Here, then, are the standard formats that can serve you as models.

#### DSV Style

DSV stands for Delimiter-Separated Values. Our first case study in textual metaformats was the `/etc/passwd` file, which is a DSV format with colon as the value separator. Under Unix, colon is the default separator for DSV formats in which the field values may contain whitespace.

`/etc/passwd` format (one record per line, colon-separated fields) is very traditional under Unix and frequently used for tabular data. Other classic examples include the `/etc/group` file describing security groups and the `/etc/inittab` file used to control startup and shutdown of Unix service programs at different run levels of the operating system.

Data files in this style are expected to support inclusion of colons in the data fields by backslash escaping. More generally, code that reads them is expected to support record continuation by ignoring backslash-escaped newlines, and to allow embedding nonprintable character data by C-style backslash escapes.

This format is most appropriate when the data is tabular, keyed by a name (in the first field), and records are typically short (less than 80 characters long). It works well with traditional Unix tools.

One occasionally sees field separators other than the colon, such as the pipe character | or even an ASCII NUL. Old-school Unix practice used to favor tabs, a preference reflected in the defaults for cut(1) and paste(1); but this has gradually changed as format designers became aware of the many small irritations that ensue from the fact that tabs and spaces are not visually distinguishable.

This format is to Unix what CSV (comma-separated value) format is under Microsoft Windows and elsewhere outside the Unix world. CSV (fields separated by commas, double quotes used to escape commas, no continuation lines) is rarely found under Unix.

In fact, the Microsoft version of CSV is a textbook example of how not to design a textual file format. Its problems begin with the case in which the separator character (in this case, a comma) is found inside a field. The Unix way would be to simply escape the separator with a backslash, and have a double escape represent a literal backslash. This design gives us a single special case (the escape character) to check for when parsing the file, and only a single action when the escape is found (treat the following character as a literal). The latter conveniently not only handles the separator character, but gives us a way to handle the escape character and newlines for free. CSV, on the other hand, encloses the entire field in double quotes if it contains the separator. If the field contains double quotes, it must also be enclosed in double quotes, and the individual double quotes in the field must themselves be repeated twice to indicate that they don't end the field.

The bad results of proliferating special cases are twofold. First, the complexity of the parser (and its vulnerability to bugs) is increased. Second, because the format rules are complex and underspecified, different implementations diverge in their handling of edge cases. Sometimes continuation lines are supported, by starting the last field of the line with an unterminated double quote — but only in some products! Microsoft has incompatible versions of CSV files between its own applications, and in some cases between different versions of the same application (Excel being the obvious example here).

#### RFC 822 Format

The RFC 822 metaformat derives from the textual format of Internet electronic mail messages; RFC 822 is the principal Internet RFC describing this format (since superseded by RFC 2822). MIME (Multipurpose Internet Media Extension) provides a way to embed typed binary data within RFC-822-format messages. (Web searches on either of these names will turn up the relevant standards.)

In this metaformat, record attributes are stored one per line, named by tokens resembling mail header-field names and terminated with a colon followed by whitespace. Field names do not contain whitespace; conventionally a dash is substituted instead. The attribute value is the entire remainder of the line, exclusive of trailing whitespace and newline. A physical line that begins with tab or whitespace is interpreted as a continuation of the current logical line. A blank line may be interpreted either as a record terminator or as an indication that unstructured text follows.

Under Unix, this is the traditional and preferred textual metaformat for attributed messages or anything that can be closely analogized to electronic mail. More generally, it's appropriate for records with a varying set of fields in which the hierarchy of data is flat (no recursion or tree structure).

Usenet news uses it; so do the HTTP 1.1 (and later) formats used by the World Wide Web. It is very convenient for editing by humans. Traditional Unix search tools are still good for attribute searches, though finding record boundaries will be a little more work than in a record-per-line format.

One weakness of RFC 822 format is that when more than one RFC 822 message or record is put in a file, the record boundaries may not be obvious — how is a poor literal-minded computer to know where the unstructured text body of a message ends and the next header begins? Historically, there have been several different conventions for delimiting messages in mailboxes. The oldest and most widely supported, leading each message with a line that begins with the string "From " and sender information, is not appropriate for other kinds of records; it also requires that lines in message text beginning with "From " be escaped (typically with >) — a practice which not infrequently leads to confusion.

Some mail systems use delimiter lines consisting of control characters unlikely to appear in messages, such as several ASCII 01 (control-A) characters in succession. The MIME standard gets around the problem by including an explicit message length in the header, but this is a fragile solution which is very likely to break if messages are ever manually edited. For a somewhat better solution, see the record-jar style described later in this chapter.

For examples of RFC 822 format, look in your mailbox.

#### Cookie-Jar Format

Cookie-jar format is used by the fortune(1) program for its database of random quotes. It is appropriate for records that are just bags of unstructured text. It simply uses newline followed by %% (or sometimes newline followed by %) as a record separator. Example 5.3 is an example section from a file of email signature quotes:

**Example 5.3. A fortune file example.**

    "Among the many misdeeds of British rule in India, history will look
    upon the Act depriving a whole nation of arms as the blackest."
            -- Mohandas Gandhi, "An Autobiography", pg 446
    %
    The people of the various provinces are strictly forbidden to have 
    in their possession any swords, short swords, bows, spears, firearms,
    or other types of arms. The possession of unnecessary implements 
    makes difficult the collection of taxes and dues and tends to foment 
    uprisings.
            -- Toyotomi Hideyoshi, dictator of Japan, August 1588
    %
    "One of the ordinary modes, by which tyrants accomplish their 
    purposes without resistance, is, by disarming the people, and making 
    it an offense to keep arms."
            -- Supreme Court Justice Joseph Story, 1840

It is good practice to accept whitespace after `%` when looking for record delimiters. This helps cope with human editing mistakes. It's even better practice to use `%%`, and ignore all text from `%%` to end-of-line.

> The cookie-jar separator was originally `%%\n`. I wanted something a bit more visible than `%` would have been. In fact, any stuff after the `%%` is treated as a comment (or at least that's how I wrote it). <br>
> -- Ken Arnold

Simple cookie-jar format is appropriate for pieces of text that have no natural ordering, distinguishable structure above word level, or search keys other than their text context.

#### Record-Jar Format

Cookie-jar record separators combine well with the RFC 822 metaformat for records, yielding a format we'll call ‘record-jar’. If you need a textual format that will support multiple records with a variable repertoire of explicit fieldnames, one of the least surprising and human-friendliest ways to do it would look like Example 5.4.

**Example 5.4. Basic data for three planets in a record-jar format.**

    Planet: Mercury
    Orbital-Radius: 57,910,000 km
    Diameter: 4,880 km
    Mass: 3.30e23 kg
    %%
    Planet: Venus
    Orbital-Radius: 108,200,000 km
    Diameter: 12,103.6 km
    Mass: 4.869e24 kg
    %%
    Planet: Earth
    Orbital-Radius: 149,600,000 km
    Diameter: 12,756.3 km
    Mass: 5.972e24 kg
    Moons: Luna

Of course, the record delimiter could be a blank line, but a line consisting of `%%\n` is more explicit and less likely to be introduced by accident during editing (two printable characters are better than one because it can't be generated by a single-character typo). In a format like this it is good practice to simply ignore blank lines.

If your records have an unstructured text part, your record-jar format is closely approaching a mailbox format. In this case, it's important that you have a well-defined way to escape the record delimiter so it can appear in text; otherwise, your record reader is going to choke on an ill-formed text part someday. Some technique analogous to byte-stuffing (described later in this chapter) is indicated.

Record-jar format is appropriate for sets of field-attribute associations that are like DSV files, but have a variable repertoire of fields, and possibly unstructured text associated with them.

#### XML

XML is a very simple syntax resembling HTML — angle-bracketed tags and ampersand-led literal sequences. It is about as simple as a plain-text markup can be and yet express recursively nested data structures. XML is just a low-level syntax; it requires a document type definition (such as XHTML) and associated application logic to give it semantics.

XML is well suited for complex data formats (the sort of things for which the old-school Unix tradition would use an RFC-822-like stanza format) though overkill for simpler ones. It is especially appropriate for formats that have a complex nested or recursive structure of the sort that the RFC 822 metaformat does not handle well. For a good introduction to the format, see XML in a Nutshell [Harold-Means].

> Among the hardest things to get right in designing any text file format are issues of quoting, whitespace and other low-level syntax details. Custom file formats often suffer from slightly broken syntax that doesn't quite match other similar formats. Using a standard format such as XML, which is verifiable and parsed by a standard library, eliminates most of these issues. <br>
> -- Keith Packard

Example 5.5 is a simple example of an XML-based configuration file. It is part of the kdeprint tool shipped with the open-source KDE office suite hosted under Linux. It describes options for an image-to-PostScript filtering operation, and how to map them into arguments for a filter command. For another instructive example, see the discussion of Glade in Chapter 8.

**Example 5.5. An XML example.**

    <?xml version="1.0"?>
    <kprintfilter name="imagetops">
        <filtercommand 
               data="imagetops %filterargs %filterinput %filteroutput" />
        <filterargs>
            <filterarg name="center" 
                       description="Image centering" 
                       format="-nocenter" type="bool" default="true">
                <value name="true" description="Yes" />
                <value name="false" description="No" />
            </filterarg>
            <filterarg name="turn" 
                       description="Image rotation" 
                       format="-%value" type="list" default="auto">
                <value name="auto" description="Automatic" />
                <value name="noturn" description="None" />
                <value name="turn" description="90 deg" />
            </filterarg>
            <filterarg name="scale" 
                       description="Image scale" 
                       format="-scale %value" 
                       type="float" 
                            min="0.0" max="1.0" default="1.000" />
            <filterarg name="dpi" 
                       description="Image resolution" 
                       format="-dpi %value" 
                       type="int" min="72" max="1200" default="300" />
        </filterargs>
        <filterinput>
            <filterarg name="file" format="%in" />
            <filterarg name="pipe" format="" />
        </filterinput>
        <filteroutput>
            <filterarg name="file" format="> %out" />
            <filterarg name="pipe" format="" />
        </filteroutput>
    </kprintfilter>

One advantage of XML is that it is often possible to detect ill-formed, corrupted, or incorrectly generated data through a syntax check, without knowing the semantics of the data.

The most serious problem with XML is that it doesn't play well with traditional Unix tools. Software that wants to read an XML format needs an XML parser; this means bulky, complicated programs. Also, XML is itself rather bulky; it can be difficult to see the data amidst all the markup.

One application area in which XML is clearly winning is in markup formats for document files (we'll have more to say about this in Chapter 18). Tagging in such documents tends to be relatively sparse among large blocks of plain text; thus, traditional Unix tools still work fairly well for simple text searches and transformations.

One interesting bridge between these worlds is PYX format — a line-oriented translation of XML that can be hacked with traditional line-oriented Unix text tools and then losslessly translated back to XML. A Web search for “Pyxie” will turn up resources. The xmltk toolkit takes the opposite tack, providing stream-oriented tools analogous to grep(1) and sort(1) for filtering XML documents; Web search for “xmltk” to find it.

XML can be a simplifying choice or a complicating one. There is a lot of hype surrounding it, but don't become a fashion victim by either adopting or rejecting it uncritically. Choose carefully and bear the KISS principle in mind.

#### Windows INI Format

Many Microsoft Windows programs use a textual data format that looks like Example 5.6. This example associates optional resources named `account`, `directory`, `numeric_id`, and `developer` with named projects `python`, `sng`, `fetchmail`, and `py-howto`. The DEFAULT entry supplies values that will be used when a named entry fails to supply them.

**Example 5.6. A .INI file example.**

    [DEFAULT]
    account = esr

    [python]
    directory = /home/esr/cvs/python/
    developer = 1

    [sng]
    directory = /home/esr/WWW/sng/
    numeric_id = 1012
    developer = 1

    [fetchmail]
    numeric_id = 18364

    [py-howto]
    account = eric
    directory = /home/esr/cvs/py-howto/
    developer = 1

This style of data-file format is not native to Unix, but some Linux programs (notably Samba, the suite of tools for accessing Windows file shares from Linux) support it under Windows's influence. This format is readable and not badly designed, but like XML it doesn't play well with grep(1) or conventional Unix scripting tools.

The .INI format is appropriate if your data naturally falls into its two-level organization of name-attribute pairs clustered under named records or sections. It's not good for data with a fully recursive treelike structure (XML is more appropriate for that), and it would be overkill for a simple list of name-value associations (use DSV format for that).

#### Unix Textual File Format Conventions

There are long-standing Unix traditions about how textual data formats ought to look. Most of these derive from one or more of the standard Unix metaformats we've just described. It is wise to follow these conventions unless you have strong and specific reasons to do otherwise.

In Chapter 10 we will discuss a different set of conventions used for program run-control files, but you should notice that it will share some of these same rules (especially about the lexical level, the rules by which characters are assembled into tokens).

* _One record per newline-terminated line, if possible._ This makes it easy to extract records with text-stream tools. For data interchange with other operating systems, it's wise to make your file-format parser indifferent to whether the line ending is LF or CR-LF. It's also conventional to ignore trailing whitespace in such formats; this protects against common editor bobbles.

* _Less than 80 characters per line, if possible._ This makes the format browseable in an ordinary-sized terminal window. If many records must be longer than 80 characters, consider a stanza format (see below).

* _Use # as an introducer for comments._ It is good to have a way to embed annotations and comments in data files. It's best if they're actually part of the file structure, and so will be preserved by tools that know its format. For comments that are not preserved during parsing, # is the conventional start character.

* _Support the backslash convention._ The least surprising way to support embedding nonprintable control characters is by parsing C-like backslash escapes — \n for a newline, \r for a carriage return, \t for a tab, \b for backspace, \f for formfeed, \e for ASCII escape (27), \nnn or \onnn or \0nnn for the character with octal value nnn, \xnn for the character with hexadecimal value nn, \dnnn for the character with decimal value nnn, \\ for a literal backslash. A newer convention, but one worth following, is the use of \unnnn for a hexadecimal Unicode literal.

* _In one-record-per-line formats, use colon or any run of whitespace as a field separator._ The colon convention seems to have originated with the Unix password file. If your fields must contain instances of the separator(s), use a backslash as the prefix to escape them.

* _Do not allow the distinction between tab and whitespace to be significant._ This is a recipe for serious headaches when the tab settings on your users' editors are different; more generally, it's confusing to the eye. Using tab alone as a field separator is especially likely to cause problems; allowing any run of tabs and spaces to be a field separator, on the other hand, works well.

* _Favor hex over octal._ Hex-digit pairs and quads are easier to eyeball-map into bytes and today's 32- and 64-bit words than octal digits of three bits each; also marginally more efficient. This rule needs emphasizing because some older Unix tools such as od(1) violate it; that's a legacy from the instruction field sizes in the machine languages of older PDP minicomputers.

* _For complex records, use a ‘stanza’ format: multiple lines per record, with a record separator line of %%\n or %\n._ The separators make useful visual boundaries for human beings eyeballing the file.

* _In stanza formats, either have one record field per line or use a record format resembling RFC 822 electronic-mail headers, with colon-terminated field-name keywords leading fields._ The second choice is appropriate when fields are often either absent or longer than 80 characters, or when records are sparse (e.g., often with empty fields).

* _In stanza formats, support line continuation._ When interpreting the file, either discard backslash followed by whitespace or interpret newline followed by whitespace equivalently to a single space, so that a long logical line can be folded into short (easily editable!) physical lines. It's also conventional to ignore trailing whitespace in these formats; this convention protects against common editor bobbles.

* _Either include a version number or design the format as self-describing chunks independent of each other._ If there is even the faintest possibility that the format will have to be changed or extended, include a version number so your code can conditionally do the right thing on all versions. Alternatively, design the format as self-describing chunks so that you can add new chunk types without instantly breaking old code.

* _Beware of floating-point round-off problems._ Conversion of floating-point numbers from binary to text format and back can lose precision, depending on the quality of the conversion library you are using. If the structure you are marshaling/unmarshaling contains floating point, you should test the conversion in both directions. If it looks like conversion in either direction is subject to roundoff errors, be prepared to dump the floating-point field as raw binary instead, or a string encoding thereof. If you're coding in C or some language that has access to C printf/scanf, the C99 %a specifier may solve this problem.

* _Don't bother compressing or binary-encoding just part of the file._ See below...

#### The Pros and Cons of File Compression

Many modern Unix projects, such as OpenOffice.org and AbiWord, now use XML compressed with zip(1) or gzip(1) as a data file format. Compressed XML combines space economy with some of the advantages of a textual format — notably, it avoids the problem that binary formats must often allocate space for information that may not be used in particular cases (e.g., for unusual options or large ranges). But there is some dispute about this, dispute which turns on some of the central tradeoffs discussed in this chapter.

On the one hand, experiments have shown that documents in a compressed XML file are usually significantly smaller than the Microsoft Word's native file format, a binary format that one might imagine would take less space. The reason relates to a fundamental of the Unix philosophy: Do one thing well. Creating a single tool to do the compression job well is more effective than ad-hoc compression on parts of the file, because the tool can look across all the data and exploit all repetition in the information.

Also, by separating the representation design from the particular compression method used, you leave open the possibility of using different compression methods in the future with no more than minimal changes to the actual file parsing — perhaps, with no changes at all.

On the other hand, compression does some damage to transparency. While a human being can estimate from context whether uncompressing the file is likely to show him anything useful, tools such as file(1) cannot as of mid-2003 see through the wrapping.

Some would advocate a less structured compression format — straight gzip(1)-compressed XML data, say, without the internal structure and self-identifying header chunk provided by zip(1). While using a format similar to that of zip(1) solves the identification problem, it means that decoding such files will be tricky for programs written in the simpler scripting languages.

Any of these solutions (straight text, straight binary, or compressed text) may be optimal depending on the relative weight you give to storage economy, discoverability, or making browsing tools as simple as possible to write. The point of the preceding discussion is not to advocate any one of these approaches over the others, but rather to suggest how you can think about the options and design tradeoffs clearly.

This having been said, the truly Unixy solution would probably be to fix file(1) to see file prefixes through the compression — and, failing that, to write a shellscript wrapper around file(1) that would interpret compression as a direction to apply gunzip(1) and take a second look.

EOF
```
