# How to Migrate IMS DB Database to HiDB

# Table of Contents

- [HIDBINIT](#step-1.-hidbinit)
	* []
	
## Step 1. HIDBINIT

To get started with OpenFrame HiDB, you need to run this tool before any other HiDB tool. This creates the 	meta tables required to operate the database.
	
```usage: hidbinit <command> <connection> [options]```
	
commands: 

| COMMAND  | DESCRIPTION                           |
|----------|---------------------------------------|
| create   | creates a meta table                  |
| drop     | deletes a meta table                  |
| truncate | removes all meta data from meta table |

**connection** - Name of the section for your database login in the 	ofsys.conf file
			Example: TVSAM

**options**

| OPTION          | DESCRIPTION                                                                                                                |
|-----------------|----------------------------------------------------------------------------------------------------------------------------|
| -t <tablespace> | Name of a tablespace. The name is used only when you are creating a meta table  (Required for Tibero and Oracle Databases) |


Full Example: ```hidbinit create TVSAM -t DEFVOL```

## Step 2. DBDGEN

Used to define the OpenFrame HiDB Database Schema. You can execute this command from command line, without running it as a JOB. This tool stores the database schema information from the DBD assembler macro in meta tables. 

**To use this command, you need to have done the hidbinit 	command first!**

This step needs to be done for a Physical DBD First, then any logical children next.
	
It is recommended that you store all DBDs in one directory. Once all the DBDs are in one directory, you can create subdirectories under for Logical Childs and Secondary Indexes to more easily understand the underlying structure of the database.

usage: ```dbdgen [options] <filename>```

**options**

| OPTION | DESCRIPTION                                                         |
|--------|---------------------------------------------------------------------|
| -f     | Deletes the existing DBD meta data and objects and creates new ones |

**filename** - Name of the file that contains the DBD control statements (i.e. the DBD assembler macro). When there are multiple files to process, enter the file names one after another.

Full Example: dbdgen -f ${dbdname}