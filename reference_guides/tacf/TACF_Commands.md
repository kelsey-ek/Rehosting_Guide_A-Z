# TACF Commands

Below, you will find all of the most common TACF related commands.

**_This guide is based on the OpenFrame TACF 7.0_Administrator's Guide 2.1.4_en_**

## Table of Contents

- [ADD GROUP](#addgroup)
- [ALTER GROUP](#altgroup)
- [ADD USER](#adduser)
- [ALTER USER](#altuser)
- [ADD System Definition](#addsd)
- [ALTER System Definition](#altdsd)

***

### ADDGROUP

TACF Command: **AG** 

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

### ALTGROUP

TACF Command: **ALG**

Functionality: Alter a group profile. If you have a group, but want to alter some attributes of the group, you can use this command to accomplish that.

<details>
	<summary>Example: Alter a Group's Superior Group to another</summary>

- Group Name 	: $GROUP
- Owner 		: $OWNER
- Superior Group: NEWGRP1
```
ALTGROUP $GROUP OWNER('$OWNER') SUPGROUP('NEWGRP1')
```

</details>

***

### ADDUSER

TACF Command: **AU**

Functionality: Add a TACF User. Each person accessing OpenFrame needs to be defined in TACF. They will receive a login and a password from the administrator who sets up their TACF ID. 

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

### ALTUSER

TACF Command: **ALU**

Functionality: Alter a user. Modify a User's permissions and details.

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

### ADDSD

TACF Command: **AD**

Functionality: Registers a discrete dataset profile or a generic dataset profile in TACF. With this command, we can define rules for datasets. A discrete dataset profile refers to a single datasets, whereas a generic dataset profile refers to any dataset that follows a specific pattern.

<details>
	<summary>Example: Add System Definition with Universal Access NONE</summary>

- Group Name    : $GROUP
- Owner         : $OWNER
```
ADDSD ('$NAME') AUDIT($AUTHORITY) DATA('$COMMENT') OWNER('$NAME') UACC(NONE) UNIT(D) VOLUME(DEFVOL)
```
</details>

***

### ALTDSD

TACF Command: **ALD**

Functionality: Modifies a specified dataset profile.

<details>
	<summary>Example: Alter System Definition with Universal Access READ</summary>

- Group Name 	: $GROUP
- Owner 		: $OWNER
```
ALD ('$NAME') AUDIT($AUTHORITY) DATA('$COMMENT') OWNER('$NAME') UACC(READ) UNIT(D) VOLUME(DEFVOL)
```

</details>