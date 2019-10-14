# TACF Commands

Below, you will find all of the most common TACF related commands.

## Table of Contents

- [ADD GROUP](#addgroup)
- [ADD USER](#adduser)
- [ADD System Definition](#addsd)

**_This guide is based on the OpenFrame TACF 7.0_Administrator's Guide 2.1.1_en_**

***

### ADDGROUP

TACF Command: AG 

Functionality: Add a TACF group. The purpose of adding groups is to predefine a set of rules and be able to apply them to multiple users without having to redefine the same set of specified rules over and over again. Instead, we can apply a set of rules to a group, and assign a user to a group which will inherit those rules.

<details>
	<summary>Example: Add Group with Superior Group</summary>

- Group Name    : $GROUP
- Owner         : $OWNER
- Superior Group: SYS1
```
ADDGROUP ('$GROUP') OWNER('$OWNER') SUPGROUP('SYS1')
```
</details>

***

### ADDUSER (AU) [Add User]

<details>
	<summary>Example: Add User with Operations attribute</summary>

- Username     : TMAX1234
- Password     : TMAXPASS
- Name         : Tmax Soft
- Owner        : ROOT
- Default Group: SYS1
- Special Attr : Operations
```
ADDUSER ('TMAX1234') PASSWORD('TMAXPASS') NAME('Tmax Soft') OWNER('ROOT') DFLTGRP('SYS1') OPERATIONS 
```
</details>

***

### ADDSD (AD) [Add System Definition]

<details>
	<summary>Example: Add System Definition with Universal Access NONE</summary>

- Group Name    : $GROUP
- Owner         : $OWNER
- Superior Group: SYS1
```
ADDSD ('$NAME') AUDIT($AUTHORITY) DATA('$COMMENT') OWNER('$NAME') UACC(NONE) UNIT(D) VOLUME(DEFVOL)
```
</details>

***

### ALTUSER (ALU) [Alter User]

<details>
	<summary>Example: Alter the TMAX1234 user's password and give SPECIAL attribute</summary>

- User Name     : TMAX1234
- Data          : <Changed to NODATA>
- Password      : NEWPASS1
- Special Attr  : SPECIAL
```
ALTUSER (TMAX1234) NODATA PASSWORD('NEWPASS1') SPECIAL
```
</details>

***

