Cookie Jar Search By Key
==================================

Description
----------------------------------

The `cookie-jar-search-by-key.awk` script searches records in a Cookie-Jar format file.

If it finds the KEY in a line that starts with `%%`, it prints the corresponding records.

The text in the same line as the record separator `%%` is used as a record KEY.

The KEY is a regula expression.

Usage:

    # prints the content of "key2" record
    cookie-jar-search-by-key.awk -v KEY="key2" example.txt

Content of `example.txt`:

    %% key1
    value1
    %% key2
    value2
    %% key3
    value3

Demonstration
----------------------------------

In this example, the script is used to find a cookie whose key matches "Earth".

```bash
# show the records whose keys contain "Earth"
./cookie-jar-search-by-key.awk -v KEY=Earth planets.txt
```
```bash
%% Earth
Planet: Earth
Orbital-Radius: 149,600,000 km
Diameter: 12,756.3 km
Eccentricity: 0.0167
Mass: 5.972e24 kg
Moons: Luna
```

This is the input file:

```
%% Mercury
Planet: Mercury
Orbital-Radius: 57,910,000 km
Diameter: 4,880 km
Eccentricity: 0.2
Mass: 3.30e23 kg
%% Venus
Planet: Venus
Orbital-Radius: 108,200,000 km
Diameter: 12,103.6 km
Eccentricity: 0.007
Mass: 4.869e24 kg
%% Earth
Planet: Earth
Orbital-Radius: 149,600,000 km
Diameter: 12,756.3 km
Eccentricity: 0.0167
Mass: 5.972e24 kg
Moons: Luna
%% Jupiter
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

