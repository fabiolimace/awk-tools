Cookie Jar Search By Value
==================================

Description
----------------------------------

The `cookie-jar-search-by-value.awk` script searches records in a Cookie-Jar format file

If it finds the VALUE in the content of records, it prints these records.

The VALUE is a regula expression.

Usage:

    # prints the record that contains "value2"
    cookie-jar-search-by-value.awk -v VALUE="value2" example.txt

Content of `example.txt`:

    %% key1
    value1
    %% key2
    value2
    %% key3
    value3

The Cookie-Jar Format is defined in The Art of Unix Programming, by Eric S. Raymond. Read the definition of Cookie-Jar and Record-Jar in [record-jar.md](record-jar.md).

Demonstration
----------------------------------

In this example, the script is used to find a cookie that contains the value "Moon".

```bash
# show the records whose contents contain "Moon"
./cookie-jar-search-by-value.awk -v VALUE=Moon planets.txt
```
```bash

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

