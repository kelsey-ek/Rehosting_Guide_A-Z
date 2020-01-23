# How to Migrate IMS DB Database to HiDB

# Table of Contents

-[HIDBINIT](#1.-hidbinit)

## 1. HIDBINIT

To get started with OpenFrame HiDB, you need to run this tool before any other HiDB tool. This creates the 	meta tables required to operate the database.
	
```usage: hidbinit <command> <connection> [options]```
	
commands: 

| COMMAND  | DESCRIPTION                           |
|----------|---------------------------------------|
| create   | creates a meta table                  |
| drop     | deletes a meta table                  |
| truncate | removes all meta data from meta table |

connection: Name of the section for your database login in the 	ofsys.conf file
			Example: TVSAM
options:

| OPTION          | DESCRIPTION                                                                                                                |
|-----------------|----------------------------------------------------------------------------------------------------------------------------|
| -t <tablespace> | Name of a tablespace. The name is used only when you are creating a meta table  (Required for Tibero and Oracle Databases) |


Full Example: ```hidbinit create TVSAM -t DEFVOL```