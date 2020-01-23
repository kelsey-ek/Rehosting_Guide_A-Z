# How to Migrate IMS DB Database to HiDB

# Table of Contents

- [HIDBINIT](#step-1-hidbinit)
- [DBDGEN](#step-2-dbdgen)
- [HDGENSCH](#step-3-hdgensch)
	
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

Full Example: ```dbdgen -f ${dbdname}```

## Step 3. HDGENSCH

 Creates data set migration schema files that are necessary for migrating Mainframe IMS DB data sets to OpenFrame HiDB data sets.

 You can create schema files with cobgensch or pligensch tool and use tham as input to the data set migration tool dsmigin. In OpenFrame HiDB however, you must use the hdgensch tool to create schema files. This is because general data sets use one-to-one mapping between a segment and copybook while there can be one-to-many mappings between a segment and copybooks in OpenFrame HiDB. hdgensch internally calls cobgensch or pligensch to process copybooks for each segment and then mergest them into a single schema file. It alsos aves the cobol layout, which is used to create the tables and DML files for each segment, in the OFM_HIDB_DBD_COLUMN meta table.

 After a scucessful run of hdgensch, a schema file is created with the DBD name and '.conv' extension and saved under the default schema directory set in the hdgensch ds.conf file and the cobol layout for each segment is saved in the meta table. The syntax of the schema file matches that of the cobgensch or pligensch tool.

usage: ```hdgensch [command] [options] <dbd-name> <copybook-dir-name>```

**commands**
	
| COMMAND | DESCRIPTION                                                                                         |
|---------|-----------------------------------------------------------------------------------------------------|
| schema  | Creates the schema file for the DBD                                                                 |
| meta    | Saves the segment layout information of the DBD in the meta table by referencing the COBOL copybook |
| all     | Executes both schema and meta commands                                                              |

**options**
	
| OPTIONS  | DESCRIPTION                                                                                                     |
|----------|-----------------------------------------------------------------------------------------------------------------|
| -v       | Displays the hdgensch version                                                                                   |
| -t <n\|b> | Specifies how to save information about a column specified in an OCCURS clause                                  |
| &nbsp;&nbsp;&nbsp;-n    | Stands for Normal (save each column as meta data by assigning a number to it)                                   |
| &nbsp;&nbsp;&nbsp;-b    | Stands for Bulk (save all columns as a single column meta data. The total length equals the sum of all columns) |