# k10plus-items 

This repository contains normalized information about libraries and holdings in K10plus union catalog.

*this is work in progress*

## Overview

### Libraries

Each library in K10plus is uniquely identified by its **ELN**.

The file `kxp-libraries.tsv` contains a table of all libraries participating at K10plus, sorted by ILN (source: <https://wiki.k10plus.de/display/K10PLUS/Teilnahme+am+K10plus>). It consists of four columns:

- ILN
- ELN
- Name
- ISIL

Each K10plus library (uniquely identified by ELN):

- belongs to exactely one ILN
- may have one (or more in very few cases) ISIL

*The current data contains a few number of libraries sharing the same ISIL, this must be fixed!*

Below the level of libraries there can be locations ("Standorte") - these are not part of this dataset yet, se <https://github.com/gbv/libsites-config> for current state.

### Items

Each item in K10plus is uniquely identified by its **EPN**. In most cases an item refers to one copy but items *may* refer to multiple identical copies as well. Each item belongs to exactely one library (identified by ELN) and exactely one title (identified by PPN).

