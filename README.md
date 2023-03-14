# k10plus-items 

This repository contains normalized information about libraries and holdings in K10plus union catalog.

*this is work in progress*

## Description

The file `kxp-libraries.tsv` contains a table of all libraries participating at K10plus, sorted by ILN (source: <https://wiki.k10plus.de/display/K10PLUS/Teilnehmende+Einrichtungen+am+K10plus>) and unique by ELN. It consists of four columns:

- ILN
- ELN
- Name
- ISIL

To connect this with K10plus title data it needs a mapping from PPN (PICA+ `003@$0`) and ILN/ELN/ISIL (`101@`), EPN (`203@`) and/or barcode (`209G`).

The file `kxp-libraries-reduced.tsv` contains all libraries with ISIL, minus department libraries that share ILN with their superordinated library (e.g. ILN `22` subsumes `DE-18` and `DE-18-15`, so only `DE-15` is included).

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

Each item in K10plus is uniquely identified by its **EPN** or by combination of **ILN** and occurrence. In most cases an item refers to exactely one **Copy** but some items have multiple copies as well. To further complicate things, a Copy can have multiple exemplars when its number is greater than one. These sub-copies usually have an individual **barcode** but this is not always the case.

Each item belongs to exactely one library (identified by ELN) and exactely one title (identified by PPN).
