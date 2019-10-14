# TACF Commands

### ADDGROUP (AG) [Add Group]

<details><summary>Example: Add Group with Superior Group</summary>

- Group Name    : $GROUP
- Owner         : $OWNER
- Superior Group: SYS1
```
ADDGROUP ('$GROUP') OWNER('$OWNER') SUPGROUP('SYS1')
```

</details>

### ADDUSER (AU) [Add User]

<details><summary>Example: Add User with Operations attribute</summary>

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

### ADDSD (AD) [Add System Definition]

<details><summary>Example: Add System Definition with Universal Access NONE</summary>

- Group Name    : $GROUP
- Owner         : $OWNER
- Superior Group: SYS1
```
ADDSD ('$NAME') AUDIT($AUTHORITY) DATA('$COMMENT') OWNER('$NAME') UACC(NONE) UNIT(D) VOLUME(DEFVOL)
```

</details>

### ALTUSER (ALU) [Alter User]

<details><summary>Example: Alter the TMAX1234 user's password and give SPECIAL attribute</summary>

- User Name     : TMAX1234
- Data          : <Changed to NODATA>
- Password      : NEWPASS1
- Special Attr  : SPECIAL
```
ALTUSER (TMAX1234) NODATA PASSWORD('NEWPASS1') SPECIAL
```

</details>