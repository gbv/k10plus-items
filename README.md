# k10plus-items 

This repository contains normalized information about libraries and holdings in K10plus union catalog.

*this is work in progress*

## Description

The file `kxp-libraries.tsv` contains a table of all libraries participating at K10plus, sorted by ILN (source: <https://wiki.k10plus.de/display/K10PLUS/Teilnahme+am+K10plus>). It consists of four columns:

- ILN
- ELN
- Name
- ISIL

## Model

![](model.svg)

### Libraries

Multiple definitions of "library" exist. The primary notion of a library in K10plus is identified by its **ELN** (external library number). Libraries are grouped by sets of one or more libraries identified by an **ILN** (internal library number).

Each Library may have one or more ISIL but the same ISIL should not belong to multiple libraries.

*The current data contains a few number of libraries sharing the same ISIL, this must be fixed!*

In DAIA Terminology a Library is an "Institution".

### Departments

Below the level of libraries there can be **Departments**. To identiy a departement it requires an ISIL, optionally combined with a code.

*Connection between Copy and Department is only possible by identification of its Item's Library* 

Department information is not stored in K10plus. See <https://github.com/gbv/libsites-config> instead.

### Items

Each item in K10plus is uniquely identified by its **EPN**. In most cases an item refers to one **Copy** but items may have multiple identical copies as well. To further complicate things, a Copy can have multiple exemplars when its number is greater than one. Copies don't have their own identifiers but their their identity comes from combination of EPN and X-Occurrence.

Each item belongs to exactely one library (identified by ELN) and exactely one title (identified by PPN).
