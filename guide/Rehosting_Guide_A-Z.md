# Mainframe Rehosting Guide A-Z

*The purpose of this document is to create a detailed step-by-step plan
for rehosting a mainframe to OpenFrame. This document will describe in
detail the processes needed and complementary scripts and manuals to
quickly, accurately, and successfully migrate a mainframe system to
OpenFrame. Most importantly, this document aims to be understandable at any level of Mainframe/OpenFrame experience. Hopefully, this document becomes something any engineer or rehosting technical team member can use and find helpful.*

# Table of Contents 

- [Pre-Migration](#pre-migration)
  * [Mainframe Environment](#mainframe-environment)
  * [OpenFrame Environment](#openframe-environment)
- [Installation](#installation)
- [Discovery](#discovery)
    * [OFMiner](#ofminer)
- [Migration](#migration)
    * [Datasets](#datasets)
    * [Source Code](#source-code)
- [OpenFrame Configuration](#openframe-configuration)
- [Operation And Administration](#operation-and-administration)
- [Applying Patches](#applying-patches)

# Pre-Migration

## Mainframe Environment

**Description**: Understanding the mainframe environment is crucial to rehosting it to OpenFrame. Once a customer is interested in rehosting, the technical details are discussed between TmaxSoft and the Customer. TmaxSoft can gather most of the critical information through a questionnaire (TODO: see reference document "Post Introduction Questionnaire"). This initial questionnaire is vital to determining the feasability of rehosting the mainframe to OpenFrame. Every customer has changed some configurations to suit their needs - There is no mainframe that is exactly like another. One of the most important tasks to rehosting a mainframe is configuring OpenFrame the same way the mainframe was configured. To accomplish this, we need to have the customer run some commands on the mainframe so we can see the results and adjust OpenFrame accordingly. A few examples are below, but this will be looked into more detail in the Configuration section.

*   COBOL Compilation Options

*   JOB Class Configuration

*   System Definitions

*   IMS And/Or CICS Region Configuration

**Reference Documents: "Post Introduction Questionnaire"**

## OpenFrame Environment

### Accessing the Linux Server

**Prerequisities:**

-   Pre-Migration (Mainframe) - Complete

**Description:** This step includes how to access the Linux server. Depending on who built the Linux Server, the steps for completing this will vary.

#### Accessing a Linux Server built by Rehosting Team

**Description:** If the server is built by the rehosting team, **most likely**, there is no VDI (Virtual Desktop Infrastructure) required. The server can be accessed via PuTTY. Please refer to the Reference Documents. However, if access to a VDI is required first, please refer to the "Accessing a Linux Server on the Customer's Private Network" section. 

**Reference Documents:** "TODO: How To Connect To A Server With PuTTY"

<h5>Accessing a Linux Server on the Customer's Private Network</h5>

**Description:** If the server is built on-site by the customer, they are **most likely** using a private network which must first be accessed via VPN (Virtual Private Network) software such as CISCO Any Connect. Instructions on accessing the server must be provided by the customer. 

#### Binary Request

**Prerequisites:** 

  - Pre-Migration (Mainframe) - Complete

  - Accessing the Linux Server - Complete

**Description:** Customer binaries must be requested through IMS. In order to request the binaries, you will need to know some information about the operating system (OS) being used on the linux server. For example, we need to know if we should provide 32 bit or 64 bit binaries.

**Reference Documents:** "TODO: How to request customer Binaries"

#### Licensing

**Prerequisites:** 

  - Pre-Migration (Mainframe) - Complete

  - Accessing the Linux Server - Complete

**Description:** Licenses will have to be issued for the products to fully operate. Production licenses must be requested through the Global Planning Team. For the licenses, we will need to know the hostname of the server, and in some cases we will also need to know how many cpu's are being used on the server. If you want to know what information you will need for each license, you can go to www.technet.tmaxsoft.com, then click on Demo License Request. This will ask you to fill out a form for each license. The required fields will describe what information you need to know to request the binary.

***

# Installation

**Prerequisites:** 

-   Binary Request - (Complete)
-   Licensing - (In Progress or Complete)
-   NDA (Non-Disclosure Agreement) - Complete
-   Server Access - (Complete)

**Description:** To install OpenFrame, TmaxSoft has created a guide describing the steps required to install OpenFrame. In some cases, you may need to run different commands based on OS or versions of the software which are all described in the Installation Guide (see Reference Document TmaxSoft\_OpenFrame7\_fix2\_Installation\_V6.22)

**Reference Documents:
"TmaxSoft\_OpenFrame7\_fix2\_Installation\_V6.22"**

## Verifying Successful Installation

**Prerequisites:** 

  - Installation (Complete)

**Description:** OpenFrame comes equipped with some very basic sample JOBs and transactions that can be run and to test the most basic functionality of OpenFrame. After you install OpenFrame, these tests should be run and marked as completed before going any further to ensure the installation was successful.

  - Boot Tibero
  - Boot OpenFrame
  - Bring up Online System (when applicable)
  - Boot Jeus
    - Boot Managed Servers (Web Administrator, OFGW, OFManager, OFMiner) 
  - Submit Sample JCL
  - Connect to Online Test Region
  - Shutdown OpenFrame
  - Shutdown Tibero

**Reference Documents:** 

  - "#TODO: How to use tmadmin"
  - "#TODO: How to boot and shutdown OpenFrame"
  - "#TODO: How to boot and shutdown Jeus and Managed Servers"
  - "#TODO: How to Submit Sample JCL"
  - "#TODO: How to connect to Online Test Region"

***

# Discovery

**Prerequisites:**

-   Installation -- Complete

**Description:** To avoid risk, we need to make sure there are no third party applications that we cannot support in OpenFrame. The majority of the Discovery should happen before the project even begins. OFMiner is a tool that can be utilized during a PoC stage to help identify some of these potential risks. In order to analyze using OFMiner, you will have to complete installation as well as Migrate the source code. The customer may not always give you full access to the source code at this stage, so it's important to understand the rules before copying anything off the mainframe. 

***

## OFMiner

**Prerequisites:**

-   Migration (Source Code) -- Complete
-   Installation -- Complete

**Description**: OFMiner is a tool used for analyzing elements in scope
starting from the JCL. It utilizes the Tmax Base, Batch, TACF, and
Tibero elements to create a detailed document describing what JOBs,
PROCs, Programs (COBOL, Assembler), and Copybooks are in scope for
rehosting. Utilizing TBAdmin is a great tool to help create this
analysis document.

[OFMinerGuide](../reference_guides/ofminer/guide/How_to_Create_an_OFMiner_Report.md "**Reference Documents: How to Create an OFMiner Report**")


***

# Migration

**Description**: This step includes migrating source code and datasets.
There are multiple options for downloading the data from the mainframe.

Below is the ordered list of the assets you will need to migrate from the mainframe to OpenFrame:

1. JCL
2. Procedure (PROC)
3. COBOL
4. COPYBOOK
5. CSD
6. Datasets
   - NON-VSAM
   - VSAM
7. Security

**Reference Documents:** "How to Source Code Transfer Process"

***

## Source Code (JCL, Procedures, COBOLs, COPYBOOKs)

**Prerequisites:**

**Description:** Source Code Transfer should begin with JCL as it is the starting point for the JOBs. In many cases, a JCL will EXEC a PROC so the PROCs should also be prioritized. The second priority should be the COBOL programs that are EXEC'd in the JCL and the PROCs. Identifying and transferring COBOL programs may be a recursive task because a COBOL program can call another COBOL program referred to as a submodule. These submodules can also call other submodules, hence the recursiveness of this task. Additionally, COBOL programs can call COPYBOOKS to define the datasets, and these COPYBOOKS can reference other COPYBOOKS. Transferring these, are tertiary priority. You will need all of these elements to complete the Analysis step using OFMiner. Once the Source Code is migrated to OpenFrame, JOBs and Online Transactions can be submitted just as they were on the mainframe. In the mainframe, an edittor is used to modify the source code. In OpenFrame, we have many options. One option is through OFStudio which is TmaxSoft's version of eclipse. This allows you to modify source code and push to a git repository to maintain your source code. Another option would be to use the command line directly and modify the source code through an edittor such as Vi, Vim, or Nano. When migrating Source code, it's important to use the -L option to create the linux new line delimiter. The third option would be to use the spfedit tool which allows you to use mainframe commands to be able to edit a dataset or member of a pds. 

__Note: For US based languages, most can be dsmigin'd with -sosi 6
option. However, if you are working for a Japanese, Korean, Brazilian --
Or any other language that may use sosi characters, Please refer to the
sosi options in the dsmigin command.__

The below information can be found by running the ```dsmigin``` command with no arguments:
```
6. SOSI type
   1 = so[EBC]si -> so[ASC]si : Keep SOSI (default)
   2 = so[EBC]si ->  _[ASC]_  : Convert SOSI to space
   3 = so[EBC]si -> [ASC]     : Remove SOSI & space padding on the right
   4 = so[JEF]si -> so[ASC]si : Replace JEF or KEIS SOSI to ASCII SOSI
   5 = BMS map conversion     : Convert double byte chracters to 0x2E
   6 = No SOSI conversion     : Perform single byte conversion only
   7 = so[EBC]si -> [ASC]  __ : Remove SOSI & space padding before 73 column
   8 = so[EBC]si -> __  [ASC] : Remove SOSI & space padding after 7 column
   9 = so[EBC]si -> ?[ASC]? : Replace SOSI by cpm map
``` 

**Reference Documents: "data\_dsmigin.sh", "data\_dsmigin.conf",
"ds\_wrap.sh"**

***

## Datasets

**Prerequisites:**

**Description:** This task can be completed in parallel to the Installation and Discovery stages. This task requires a lot of effort and should be handled by no less than two engineers. We are currently in the process for standardizing how we are downloading datasets from the Mainframe to OpenFrame. Every mainframe is different, but a process should be created to standardize the process for each environment.

### Standard Process (NON-VSAM):

  1. Customer needs to provide the copybooks. Each dataset has a corresponding copybook. There is no way for OpenFrame engineers to know which copybooks map to which datasets. The customer should provide a spreadsheet with the mapping. If the customer does not provide the copybooks, we can use OFMiner to generate the copybooks, but we cannot guarantee the integrity of the data using this method. 

  2. An excel spreadsheet should be maintained with the names of the datasets, corresponding copybooks, RECFM, LRECL, BLKSIZE, DSORG, VOLSER, VSAM (KSDS/ESDS/RRDS), KEYOFF, KEYLEN, MAXLRECL, AVGLRECL, CISIZE, IGNORE (Should this dataset be ignored when trying to retrieve from the mainframe), FTP (Yes or No - Should this dataset be FTP'd), FTPDATE, FTPTIME, DSMIGIN, DSMIGINDATE, DSMIGINTIME

  3. Once the excel spreadsheet is created a script should be used to parse the spreadsheet and the dsmigin commands are created.

  With one customer, we are accomplishing this using 1 script called dsmigin.py. This python program queries the mainframe by connecting through linux ftp. After ensuring that the dataset is not migrated (archived), it will retrieve the dataset using the FTP command. The user can also pass options to execute the dsmigin command after retrieving the datasets.

### VSAM Process

  1. Unload VSAM files on Mainframe to Flat (PS) files.

  2. FTP the datasets from Mainframe to OpenFrame server

  3. Listcat the VSAM file on the Mainframe to obtain the attributes of the VSAM

  4. Use the attributes from Listcat to Create the empty VSAM file on OpenFrame (idcams define cluster)

  5. Use idcams repro. As input, use the unloaded flat file, and as output, use the empty VSAM on OpenFrame

**Reference Documents:** #TODO: attach dsmigin.py after removing customer references

***

# OpenFrame Configuration

**Prerequisites:**

-   Migration (Source Code) -- Complete
-   Installation -- (Complete)

**Description:** In order for batch JOBs and Online Transactions to run correctly, configuration changes must be made to the environment to match the Mainframe specifications. Below is a list of the items you may or may not have to modify based on the customer's mainframe configuration:

**Note:** You can read more about each of these configuration files based on the reference documents and manuals mentioned below.

## TACF

**Prerequisites:** 

-   Installation -- (Complete)

**Description:** TACF (Tmax Access Control Facility) is responsible for handling user authentication, resource access control, and logging resource access statistics. TACF protects the system from unauthorized users by managing a list of registered users and system authorities within Tibero. TACF alsorecords user and resource access histories as logs, which are used as source data for statistical information. 

**What you need to know:** 

-   How to change the password rules for TACF

    Create a C program using the saf_exit.h header file located in $OPENFRAME_HOME/include. An example function is provided below:

<details><summary> Click here for the C code </summary>

```
int customer_saf_exit_password(char *userid, char password, int count, char *history[])
{
  
  <Add Logic Here using the above pointers>

}
```

</details>

## BATCH
  **Prerequisites:** 

  - Installation -- (Complete)

**Description:** 

## ONLINE

<h4>OSC Configuration (OpenFrame System for CICS)</h4>

**Description:** Online Resources on the mainframe are defined in System Definitions Macro Files. For OpenFrame to access the resources, they must be defined in OpenFrame's System Definitions (OSD). Before loading the System Definitions, we need a VSAM dataset to load them into. However, loading all of System Definitions into the run time memory would be unnecessary, so only the System Definitions in the GRPLIST are added. 

Step 1.) Create the VSAM Dataset

```
idcams define -t CL -n OSC.SDMAKE.TEST -o KS -k 18,0 -b 32768 -l 128,32760 -s 1024,128,128 -v DEFVOL
```

Step 2.) Load the VSAM Dataset with the System Definitions File from the Mainframe

```
oscsdgen -c -d OSC.SDMAKE.TEST [MACRO_FILE]
```

<h5>oscsddump</h5>

It should be noted that OpenFrame comes with a utility ```oscsddump``` which can be used to dump the OpenFrame System Definitions (OSD) to a regular file. This regular file can then be used to add or modify the existing OSD's. Each region has it's own dataset, and you can dump the OSD by specifying the region name or the vsam dataset.

```
oscsddump -d <dataset> <output_file_name>
oscsddump -r <region> <output_file_name>
  -d <dataset> : The name of the OSC SD dataset to be exported

  -r <region>  : OSC region name from where datasets will be exported.

  -  <file>    : Specifies the name of the macro file to be created. 
                 If a file with this name already exists, it 
                 will be overwritten.
```
<h5>oscrtsddump</h5>

Similar to oscsddump, OpenFrame has an oscrtsddump utility which can dump the System Definitions from the GRPLIST stored in the runtime. 

```
oscrtsddump -r <region> <file>
  -r <region>  : Specifies an OSC region name

  - <file>     : Specifies the name of the macro file to be created.
                 If a file with this name already exists, it 
                 will be overwritten.
```

<h5>osctdlupdate</h5>

Dynamic Modules, such as Cobol programs can modified during OSC uptime, but the integrity of a transaction in progress must be preserved. Therefore, when an online COBOL program is modified and recompiled, it is not updated in OSC until the osctdlupdate command is run. This tool registers and updates dynamic modules within OSC regions.

Dynamic Modules include:

* BMS (Basic Map Support)

* COBOL 

```
osctdlupdate <region> <module>
  - <region>   : Specifies an OSC region name

  - <module>   : Specifies an application module name
``` 

<h5>Understanding Basic Map Support (BMS) Files</h5>

* DFHMSD - Declares a mapset

<details><summary>Click here to see what Keywords can be specified for the DFHMSD macro command</summary>

  <details><summary>COLOR</summary>

  - specifies the basic color for the mapset. Users can choose one of the following: DEFAULT, BLUE, RED, PINK, GREEN, TURGOISE, YELLOW, or NEUTRAL

  - COLOR for DFHMDF or DFHMDI is already set; the color set for DFHMSD has the lowest priority.
  
  </details>

  <details><summary>CTRL</summary>

  - Sets characterstics of all maps included in mapsets.

  - One of the following options can be entered

    - PRINT: Prints transferred map data
    
    - LENGTH: Sets the maximum number of characters for a row transferred to a printer.

    - FREEKB: Releases the keyboard lock when transferring maps.

    - ALARM: Sends an alarm if an alarm is sent to the TN3270 terminal.

    - FRSET: Resets the MDT bits of all fiends including in maps when transferring maps.
  </details>

  <details><summary>HLIGHT</summary>

  </details>

</details>

* DFHMDI - Declares a map

* DFHMDF - Declares a field



<h4>OSI Configuration (OpenFrame System for IMS)</h4>

### Configuration Files

**Location of these files:** $OPENFRAME_HOME/config

<details><summary>Click here to see the configuration files</summary>

* **cpm.conf**

  Base: The cpm.conf configuration file contains the settings for conversion process from Mainframe to OpenFrame.

* **dbutil.conf**
* **ds.conf**
* **dstool.conf**

  Base: Contains settings for dataset related tool programs such as Command section in OFManager

* **ezaci.conf**
* **ezplus.conf**
* **ftp.conf**
* **hidb.conf**

  Specifies the basic settings of OpenFrame/HiDB. In the [GENERAL] section, you can specify:

  <details><summary>See hidb.conf main options</summary>

    <pre>- COPYBOOK_DIR: Directory fo a copybook that OpenFrame/HiDB and ofschema refer to. COPYBOOK_DIR sets the preferred path used by OpenFrame/HiDB, which refers to copybooks under the subdirectory dbd_name/segment_name or psbpcb_id/senseg_name. 
    - TABLESPACE: Table space in which OpenFrame/hiDB creates segment tables, indexes, and views.
    - HIDB_OBJECT_DIR: Directory under which the hidbmgr tool generates DL/I function code
    - FIX_DATA_ERROR:
      - YES: Indicates that when an invalid data is encountered while the hidbmgr tool generates a DL/I statement, the data is set as the default value (for example, binary: 0) and no error is thrown
      - NO: Indicates that when an invalid data is encountered while the hidbmgr generates a DL/I statement, an error is processed and the program is terminated. (Default)
    - NO_INDEX_TABLE: 
      - YES: Indicates that secondary indexes are stored in the same table as the target segment table. The target and source segments must be identical, and you cannot change the index segment directly on the segment table
      - NO: Indicates that secondary indexes are stored in seperate index segment table. (Default)
    - IGNORE_FILLER: 
      - YES: Indicates that the dbdgen tool does not create a FILLER column, and that FILLER is not processed by the DL/I function created by the psbgen tool.
      - NO: Indicates that the dbdgen tool creates a FILLER column, and the FILLER is processed by the DL/I function. (Default)
    - COMMIT_INTERVAL: Maximum count that HiDB performs a DL/I function before commit. Set to a number from 0. If set to 0, commit is performed once when the database session ends. (Default: 0)
    - RESOLVE_HINT_DIR: Directory where the index hint mapping information is to be used when using the user-defined index hint in the select API of the DL/I library created by the dligen command of the hidbmgr tool.
    - FIRST_FETCH_COUNT: FIRST_ROWS hint value in the select API of the DL/I library created by the dligen command of the hidbmgr tool. Set to a number from 0. If set to 0, the FIRST_ROWS hint is not used (Default: 10)
    - GU_PREDICT_FAILURE_THRESHOLD: Number of consecutive failed GET UNIQUE. Set to a number from 0. If GET UNIQUE fails consecutively as many times as the set number, an appropriate select query is requested. (Default: 0)
    - #TODO: FIX THIS SENTENCE: GU_PREDICT_FAILURE_RESET: Number of consecutive success GET UNIQUE. Set to a number from 0. If GET UNIQUE success consecutively as many as the set number when the select query executed because GU_PREDICT_FAILURE_THRESHOLD is reached, it operates normally (Default: 0)
    - HIDB_ALTER_KEYSEQ: 
      - YES: Allows the user of a user-defined sorting order when defininig virtual columns and indexes in the database or when using a where condition for a select query. This setting is not recommended. 
      - NO: Performs the binary sort order. (Default)
    - DATABASE_CHARSET: Character set name that corresponds to the setting in the original database when using ALTER_KEYSEQ
    - EBCDIC_CHARSET: Character set name that corresponds to the user-desired sort order when using ALTER_KEYSEQ.
    - OF_CHARSET: System local value for multi-byte character processing.
    - IGNORE_AUTH_CHECK: 
      - YES: integrates with TACF to use it's user authentication.
      - NO: does not use TACF user authentication. (Default)
    - FETCH_COL_DEFAULT_VALUE: Hex value of the character to be set when the data fetched from the select API of the DL/I library created by the dligen command of the hidbmgr tool is null. (Default: 0x00)
    - RESET_APPBUF_IF_GET_FAIL: 
      - YES: sets the buffer data passed from the application to null when the DLI GET command fails. (Default)
      - NO: Does not change teh buffer data when the DLI GET command fails.
    - SKIP_POSITIONING_IF_GET_FAIL: 
      - YES: Does not specify the location of the last segment accessed when the DLI GET command fails. This setting is not recommended.
      - NO: Does not change the buffer data when the DLI GET command fails. (Default)
    - HiDB_IMPORT_DIR: Directory path to store data when using high-speed loading of hdload and hidbptmgr tools
    - USE_LEAD_FOR_GN: 
      - YES: Requests a select query along with LEAD for a DLI GET NEXT request that does not specify a search condition. (Default)
      - NO: Does not use LEAD
    - USE_LEAD_FOR_GNP: 
      - YES: requests a select query along with LEAD for a DLI GET NEXT IN PARENT request that does not specify a search condition. (Default)
      - NO: Does not use LEAD

  In the [DEBUG] section, you can specify:

    - GENERAL:
      - YES: Enables the default debugging flags when OpenFrame/HiDB is running.
      - NO: Disables the default debugging flags when OpenFrame/HiDB is running. (Default)
    - SHOW_BUFFER: (Enabled when GENERAL is set to YES)
      - YES: Processing a DL/I statement returns the buffer value of each column.
      - NO: Processing a DL/I statement does not return the buffer value of each column. (Default)
    - DISABLE_COMMIT
      - YES: Indicates that a DL/I operation does not save changes to the database.
      -NO: Indicates that a DL/I operation saves changes to the database. (Default)</pre>
    </details>

* **idcams.conf**
* **ikjeft01.conf**
* **ims.conf**

  HiDB: Used to configure control block data sets used in the DB/DC system. More specifically, allows for configuration of the default library data set and volume serial that define DBD control blocks, PSB control blocks, DAB control blocks, and ACB control blocks.

* **isrsupc.conf**
* **keyseq.conf**
* **ofosc.seq**
* **ofstudio.conf**
* **ofsys.seq**

  Base: Contains general system settings for OpenFrame (Mainly those regarding the system directory structure)


* **osc._servername_.conf**

  OSC: This file contains environment variables that apply to the OSC application server named _servername_. If the OSC application server name is OSC00001, then the file name will become osc.OSC00001.conf. Some of the environment variables in osc._servername_.conf can also be found in the osc.conf file, possibly with different values. Where duplicates exist, the value in the osc._servername_.conf always takes precedence. Below is sections of the OSC._servername_.conf in more detail:

  <details><summary>Click here for more information about osc._servername_.conf</summary>
    <p>

    - CPM: Specifies the CCSID number which will be used by the OSC application server and the TN3270 client.
      - REGION_CCSID: Specifies the CCSID number that the OSC application server will use. A maximum of one CCSID can be specified.
      - 3270_CCSID: Specifies the CCSID number that the TN3270 emulator will use. A maximum of two CCSIDs can be specified. If a 1-byte character code page and a 2-byte character code page are used together, as with the Japanese language, two CCSIDs must be set together. CCSID is an abbreviation for Coded Character Set Identifier, which is used by IBM to identify a specific encoding of a specific code page. CCSID enables transmission of data between the OSC application server and the TN3270 emulator. The OSC application server uses ASCII strings while the TN3270 emulator uses EBCDIC strings. Therefore, it is necessary for the OSC application to convert strings either to receive or sent them. During the conversation, the server refers to CCSID values specified in the [CPM] section.
      - The following are the most communly used values
        - 37: COM EUROPE EBCDIC
        - 290: JAPANESE EBCDIC
        - 300: JAPAN DB EBCDIC
        - 437: USA PC-DATA
        - 933: KOREAN MIX EBCDIC
        - 943: JAPAN OPEN
        - 949: KOREA KS PC-DATA

        For more information about CCSID, visit https://www-01.ibm.com/software/globalization/ccsid/ccsid_registered.html

        Below is an example of the [CPM] section:

        ```
        [CPM]
        REGION_CCSID=437
        3270_CCSID=37
        ```

    - CPM_FLAG: Sets CPM flag options used when converting EBCDIC to ASCII or visa versa.
      - EBCDIC_TO_ASCII: Flag used when converting EBCDIC to ASCII
        - CPM_CONVERT_SOSI_TO_NULL: convert SOSI to NULL. (Default). 
        - CPM_CONVERT_SOSI_TO_SPACE: convert SOSI to SPACE.
      - ASCII_TO_EBCDIC: Flag used when converting ASCII to EBCDIC
        - CPM_CONVERT_SOSI_TO_NULL: convert SOSI to NULL. (Default).
        - CPM_CONVERT_SOSI_TO_SPACE: convert SOSI to SPACE

        Below is an example of the [CPM_FLAG] section:

        ```
        [CPM_FLAG]
        EBCDIC_TO_ASCII=CPM_CONVERT_SOSI_TO_NULL
        ASCII_TO_EBCDIC=CPM_CONVERT_SOSI_TO_NULL
        ```

    - GENERAL: Contains startup, operation, and resource information for the OSC application server.
      - ACBLIB_DSNAME: Specifies the name of the data set where ACBLIB information is stored when DL/I is used in OSC.
      - CBLPSHPOP: Specifies whether or not the PUSH/POP functions will be used for handler information, in cases where other programs are called from in a COBOL program with the CALL command.
      - CWA_SIZE: Sets the size of the shared memory block where the COmmon Work Area (CWA) information is stored (decimal, bytes).
      - FREEKB: Specifies whether to disable keyboard lock when shutting down a transaction (Default: NO)
      - GMTEXT: Sets the message used in GMTRAN (maximum of 246 characters, excluding quotation marks). (Default: 'OpenFrame OSC System')
      - GMTRAN: Specifies the ID of a transaction to be automatically executed when a terminal connects for the first time (Default: CSGM)
      - IMSID: Specifies an OSI Control region name that manages DB information when DL/I is used in OSC.
      - JOBID: Designates the JOB ID for the OSC system. A JOB ID is composed of 3 letters (do not use JOB) and 5 numbers. A unique value must be set in all the regions of OSC, and there must not be a duplicate value. The specified JOB ID is used as a directory name created under the ${OPENFRAME_HOME}/spool directory, when OSC uses spool data. When the SPOOL WRITE command is used, the spool data will be stored in the directory which has the same name as the specified JOBID. When the WRITEQ TD command is used, data will be created in a directory named 'JOBID' and the SPR ID of the server process that executed the command.
      - JOBNAME: Specifies a JOB name for the OSC region (8 Byte String).
      - MAPDIR: Specifies the directory where OSC maps will be stored. If no MAPDIR is specified, OSC uses ${OPENFRAME_HOME}/osc/region/{Region name}/map
      - MC: Specifeis whether or not the Transaction Monitoring function of OSC will be used
      - MSGCLASS: Specifies the default SYSOUTCLASS of TPEFILE(OUTPUT) among EXTRA TDQ
      - NOUSE: Specifies modules that will NOT be used by the OSC system. To specify more than one module, seperate module names with commas. 
        - DL: DL/I function
        - DS: Data set access function (If specified, file, TSQ, TDQ and Spool cannot be used)
        - MS: MSC access function.
        - NC: NCS (Named Counter Server) access function.
        - SA: SAF (TACF) access function
        - SP: Spool Access Function
        - TS: TSQ access function
        - AS: OFASM module
    - SAF: Contains security-related environment variables.
    - SD: Contains environment variables related to system definition data sets used by the OSC application server.
    - TDQ: Contains environment variables related to the Transient Data Queue (TDQ).
    - TSQ: Contains environment variables related to the Temporary Storage Queue (TSQ)
    - TRANCLASS: Contains environment variables related to the Tranclass of a region.
  </p></details>

* **osc.conf**

  OSC: used to configure the TSAM and OSC system settings that are common to all OpenFrame OSC regions. This eliminates the need to individually configure duplicate settings in each osc._servername_.conf file 

  <details><summary>Click here for more information about osc.conf</summary>
    <p>

    - Sections:

      - GENERAL: Contains information related to starting up and operating OSC regions. Also contains resource information settings.
        - SYSTEM_LOGLVL: Sets the log level of the OSC SYSTEM (#TODO: Example Range)
        - NCS_FILE: Designates a temporary file which stores information used by the Named Counter Service (NCS).
        - NCS_WRITE_COUNT: Specifies whether to manage the information used in in a disk (AUX), or in memory (MAIN). (Default Value: AUX)
        - NCS_WRITE_COUNT: Stores a value in NCS_FILE for every specified count and increments a value in a unit specified in a count when NCS_STORAGE=AUX. Specifies a value in multiples of 1 or 10.
        - XA_TSAM_DB: Specifies OPENINFO value in the DB section of a Tmax configuration file to support TSAM-XA.
        - ASMTBL: Enables loading ASM tables to shared memory. (Default value: NO)
        - DBCONN: odbc-section-name in ofsys.conf (#TODO: Create link)
      - TSAM_CLIENT: Contains connection information used for managing user VSAM data sets in an OSC system.
        - USERNAME: Username used to connect to TSAM
        - PASSWORD: Password (plaintext string) used to connect to TSAM. If ENPASSWD is also specified, ENPASSWD will take precedence.
        - ENPASSWD: Encrypted password (hexadecimal) used to connect to TSAM
        - DATABASE: Tibero database connection address used by TSAM. TB_SID registered in tbnet_alias.tbr of Tibero is used

          Example of TSAM_CLIENT section:

          ```
          [TSAM_CLIENT]
          USERNAME=oframe
          PASSWORD=tmax1234
          DATABASE=TVSAM
          ```

      - TSAM_BACKUP: Contains backup connection information that will be used if a connection to TSAM_CLIENT cannot be made
        - USERNAME: Username used to connect to TSAM
        - PASSWORD: Password (plaintext string) used to connect to TSAM. If ENPASSWD is also specified, ENPASSWD will take precedence.
        - ENPASSWD: Encrypted password (hexadecimal), used to connect to TSAM.
        - DATABASE: Tibero database connection address used by TSAM. The TB_SID registered in the Tibero file; tbnet_alias.tbr is used.
        - RETRY_COUNT: The number of times to try reconnecting to the backup address, if the connection to TSAM fails.
        - RETRY_INTERVAL: The interval (in seconds) between attempts to reconnect to the backup server.

        Example of TSAM_BACKUP section:

        ```
        [TSAM_BACKUP]
        USERNAME=oframe
        PASSWORD=tmax1234
        DATABASE=TVSAM
        RETRY_COUNT=10
        RETRY_INTERVAL=10
        ```

      - OSCMCSVR: Contains environment variables related to OSCMCSVR, on OSC system server
        - REGION: Specifies the number of regions that will use the monitoring function. This number must match the number of regions listed below.
        - REGION\__regionname_: _regionname_ is replaced by each OSC region name. Designates teh logged areas in the data section fields of the performance record. Each area is givin in the form of 'Offset-Length', and each offset must be specified sequentially.

        Example of OSCMCSVR section:

        ```
        [OSCMCSVR]
        REGION=2
        REGION_OSC00001=0-10,100-30
        REGION_OSC00002=100-50,200-10,300-65
        ```

      - OSCSCSVR: Contains environment variables related to oSCSCSVR, an OSC system server
          - BACKUP: Sets whether or not to back up unexpired scheduling information 
            - NONE: No Backups. (Default)
            - TSAM: Back up through a TSAM data set
          - BACKUP_DATASET: Specifies the data set where the scheduling information that has not expired will be backed up. This item has no effect if the backup item is set to NONE. The data set must be in KSDS format, with a 20 byte key field. Record length can be variable and must be between 20 and 32700 bytes long.
      - OSCOLSVR: Contains environment variables related to OSCOLSVR, an OSC system server
        - BUFFERING_SIZE: Specifies the buffering type and buffer size for the service logs. If the field is not specified, buffering is disabled and the size of the default buffer depends on the system. 
          - LINE: Characters are line buffered and are transmitted when a newline character is encountered.
          - size: Characters are block buffered and are transmitted in blocks of a specified size (bytes).
        - FLUSH_INTERNAL: Specifies the interval at which the buffered data are flushed. If the field is specified as 0, the buffered data are flushed immediately.

        Example of the OSCOLSVR section:

        ```
        [OSCOLSVR]
        BUFFER_SIZE=4096
        FLUSH_INTERVAL=0
        ```

      - OSCOSSVR: Contains environment variables related to OSCOSSVR, an OSC system server
        - DEPLOY_SOURCE_PATH: Source path of an OSC module to deploy

        Example of the OSCOSSVR section:

        ```
        [OSCOSSVR]
        DEPLOY_SOURCE_PATH=$OPENFRAME_HOME/rdom
        ```
  </p></details>

* **osc.lu.conf**
* **osc.region.list**
* **osc._IMSID_.conf**

  OSI: Configuration file where items to be applied by IMSID in the OSI system are configured. If the actual environment configuration file name's IMSID is IMSA, then the file will be named "osi.IMSA.conf"

* **osi.conf**

  OSI: Configuration File which is mutually referred to in all the modules of the OSI system. It configures all the items which will be mutually applied to all the server types supported in OSI

* **osi.ofsys.seq**

  OSI: In the OSI system, the tmax servers which will start when osiboot is performed by specifying the name of Base, Batch and TACF, servers excluding the system server (control region), can be selected. Each server of the TN3270 Gateway is included.

* **osi.ofsys.seq_for_OSI_ONLY**
* **osi.ofsys.seq_orig**
* **print.conf**
* **rc.conf**
* **saf.conf**

  Base: Contains the OpenFrame System Access control settings
  TACF: Specifies the basic information necessary for operations of TACF, specifies the authentication method used in TACF, specifies the configurations needed in SASVR, Specifies an output message for a previous user-defined error code when checking a password in a user created function (saf_exit).

* **smf.conf**
* **sms.conf**
* **sort.conf**
* **ssm.IMSADB2T.conf**
* **tacf.conf**

  TACF: When TACF is installed, the TACF configuration file tacf.conf is generated. This file contains basic TACF configuration information, specifies resource information for TACF ODBC connection, specifies whether TACF will check the group that users belong to when they attempt to access resources, and specifies to control whether RACF allows users to access datasets whos profiles are not registered in TACF.

* **textrun.conf**
* **tjclrun.conf**
* **tjes.conf**

  - JOBCLASS
      + What: Specifies what a JOB should do when submitted on OpenFrame. (START, HOLD, etc)
      + Where: ${OPENFRAME_HOME}/config/tjes.conf
      + How: Add a line after the existing JOBCLASS section for additional classes 
      + Example:
      <pre>
      [JOBCLASS]
      A=START
      B=HOLD
      <b>C=START</b></pre>

* **tjesmgr.conf**
* **tso.conf**
* **unit.conf**
* **volume.conf**
* **vtam.conf**</details>

**Reference Documents:**
<details><summary>Click Here for Reference Documents</summary>

  * **Base:** OpenFrame_Base_7_Fix#3_Base_Guide_v2.14_en.pdf
  * **OSI:** OpenFrame_OSI_7.1_Administrator's_Guide_V2.1.1_en.pdf
  * **OSC:** OpenFrame_OSC_7_Fix#3_Administrator's_Guide_v2.1.5_en.pdf
  * **TACF:** OpenFrame_TACF_7_Fix#3_Administrator's_Guide_v2.1.4_en.pdf
  * **HiDB:** OpenFrame_HiDB_7.1_HiDB_Guide_v2.1.4_en.pdf

</details>

## Source Compilation

**Prerequisites:** 

-   Installation -- Complete
-   OpenFrame Configuration -- In Progress or Complete

**Description:** In order to compile source code such as COBOL, Assembler (ASM), PL/I, BMS, MFS, DBDs, PSBs, you will need to first complete some configuration. There are many compiler options available to mainframe, and we need to configure OpenFrame to compile source code the same way it is done on the mainframe. 

<h3>COBOL</h3>

#TODO

<h3>Assembler</h3>

#TODO

<h3>PL/I</h3>

#TODO

<h3>BMS</h3>

#TODO

<h3>MFS</h3>

#TODO

<h3>DBD</h3>

#TODO

<h3>PSB</h3>

#TODO

## Running Batch JOBs

**Prerequisites:**

-   Installation -- Complete
-   OpenFrame Configuration -- Complete
-   Source Compilation -- Complete

**Description:** Now that your configuration is completed, it's time to start running Batch JOBs. There are many different ways a BATCH JOB can be submitted, please see the sections below for whichever method suits you best. In most cases, the customer will prefer to use OFManager, so getting familiar with submitting JOBs through OFManager is recommended.

<h3>Tjesmgr</h3>

#TODO

<h3>Textrun</h3>

#TODO

<h3>OFManager</h3>

#TODO

<h3>OFStudio</h3>

#TODO

## Running Online Transactions

**Prerequisites:** 

-   Installation -- Complete
-   OpenFrame Configuration -- Complete
-   Source Compilation -- Complete

**Description:** Online Transactions can be run through a series of interconnected components: WebTerminal and 3270 Gateway (OFGW). In general, a transaction will be running in an online region in OpenFrame. OFGW will interact and translate the messages flowing through from the webtermanal to the region and visa-versa. The end result is an online screen where users can interact and view, modify, or delete information on the underlying database. 

<h3>OSC</h3>

#TODO

<h3>OSI</h3>

#TODO

## JOB Stream and Scheduler

**Prerequisities:**

-   Installation -- Complete
-   OpenFrame Configuration -- Complete
-   Running Batch JOBs -- In Progress or Complete

**Description:** A mainframe scheduler's purpose is to define which and when JOBs will run. Additionally, logic can be added to the scheduler to determine what subsequent JOBs are to be run based on return codes from previous JOBs. Similar to the mainframe, OpenFrame can also work with most schedulers, so JOBs can be run the same way they run on the mainframe.

<h3>Control-M</h3>

#TODO

<h3>Autosys</h3>

#TODO

## Operations & Maintenance

**Prerequisites:**

-   Installation -- Complete
-   OpenFrame Configuration -- Complete
-   Running Batch JOBs -- In Progress or Complete

**Description:** Now that the mainframe has been rehosted to an Open System, you now have the freedom to develop and customize OpenFrame to meet your demands. OpenFrame comes well equipped with many self-managing tools to help organize your environment, while maintaining smooth and reliable operation. In this section, we will go through some useful utilities that OpenFrame comes with by default, and some useful shell scripts to increase efficiency in daily operations.

<h3>Useful Scripts</h3>

- Spools

  - Backup

    - auto\_backup\_spool.sh (TODO: Add supporting scripts and Documentation)

  - Restore

- JEUS

  - catdomain (TODO: Add supporting scripts and Documentation)

- BATCH

  - scan\_fix.sh (TODO: Add supporting scripts and Documentation)

<h3>Patching OpenFrame</h3>

# Operation and Administration

## TACF

**Description:** Below are the most commonly used TACF commands. All of the commands can be run from the command line or through OFManager. If you use the command line option, you need to log in to ```tacfmgr``` as a SPECIAL user

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

## BATCH

## ONLINE

***

# Applying Patches

**General Notes:**

1. A Patch directory (from here on out refered to as ${patch_dir}) should be created somewhere. In general, we create a PATCH directory inside of the _tmaxsw_ folder, then we create directories for each of the products.

  The end product should look like:

```
${patch_dir}/
  OFCOBOL/
  PROSORT/
  OFASM/
```

2. Once a patch is downloaded, it should be ftp'd to the ${patch_dir} and placed in the appropriate folder in regards to the IMS ticket. i.e. If the IMS ticket category is OFCOBOL, the patch should go in the ${patch_dir}/OFCOBOL.

3. Create a directory inside ${patch_dir}/${product} with the IMS ticket number and the date. 

  The end product should look something like this:

```
${patch_dir}/
  OFCOBOL/
    IMS123456_20190828/
      libgeneric.so
      FTP
      tmadmin
    IMS654321_20190829/
      libgeneric2.so
  PROSORT/
    IMS987654_20190829/
      prosort/
    IMS456789_20190830/
      prosort/
  OFASM/
    IMS242424_20190830/
      ofasm/
```

## OpenFrame

*General Notes:* 

1. Compilers and Prosort are patched the same way (for the most part). Therefore, OFASM, OFCOBOL, OFPLI, and Prosort follow the same general process, but for completeness sake, they are all explicitly listed below.

2. OpenFrame Base, Core(TMAX), OSI, HiDB, and TACF generally come in the form of individual library, binary, and utility files. These can all be patched the same way.

3. ofpatch.sh is a shell script which can be utilized to quickly and easily patch library, binary, and utilities. It utilizes the <pre>offile</pre> command to test what kind of file it's patching, places it in the correct place, and then creates a symbolic link to the new file. In essence, this is what it does:

Before:
<pre>
  libfile.so
</pre>

Execution:
<pre>
  ofpatch.sh -n 000001 libfile.2.so
</pre>

After:
<pre>
  libfile.so --> libfile.2.so   (this is a symbolic link to the new library file)
  libfile.so                    (this is a backup of the old file)
</pre>

4. It's recommended that you keep track of the patches thoroughly. You can accomplish this by doing 2 things:
  - Add the IMS ticket number which the patch was supplied through in the name of the file. For most of the examples below, we will use 000001 as the IMS ticket number.
  - Add the date to the patch file name so you can tell when the patch was applied.

### OFCOBOL

<details><summary>Steps</summary>

OFCOBOL patches generally come in the form of entire directories. 

**Step 1.** Unlink the current OFCOBOL directory
<pre>
cd <i>${OFCOBOL_HOME}</i>
cd ..
unlink OFCOBOL
</pre>
**Step 2.** Download the patch to the <i>${patch_dir}/OFCOBOL/${ims_date}</i> directory

**Step 3.** Unpack the patch file
<pre>
tar -xzvf <i>${patch_file}</i>.tar.gz
</pre>
**Step 4.** There are two ways to manage directory-type patches. What I mean by directory-type patches, is patches that come in the form of full directories. You can either create a symbolic link to the path noted in step 2 or you can delete the existing OFCOBOL folder and replace it with a copy from the directory noted in step 2.

   - **Step 4a.** Symbolic link: 
<pre>
cd /opt/tmaxapp
ln -s <i>${patch_dir}/OFCOBOL/${ims_date}</i> OFCOBOL
</pre>

   - **Step 4b.** Create a copy:
<pre>
cd /opt/tmaxapp
rm -r OFCOBOL
cp -r <i>${patch_dir}/OFCOBOL/${ims_date}</i>/OFCOBOL .
</pre>
**Step 5.** Copy the old license directory to the new patched directory.
<pre>
cp -r <i>${OFCOBOL_BACKUP}</i>/license <i>${OFCOBOL_HOME}</i>
</pre>
**Step 6.** Check the current version to ensure that the patch was successful
<pre>
ofcob --version
</pre>
**Step 7.** Test the patch - Did it resolve the issue the patch was created for in the first place?

After applying the patch, the original issue reported in the IMS ticket should be retested.

**Step 8.** Receive confirmation from the Customer that the patch was successful.

</details>

### PROSORT

<details><summary>Steps</summary>

Prosort patches generally come in the form of entire directories, but may also include some library files. In this guide, we will explain how to handle both.

**Step 1.** Unlink the current Prosort directory

<pre>
  cd <i>${PROSORT_HOME}</i>
  cd ..
  unlink PROSORT
</pre>

**Step 2.** Download the patch to the <i>${patch_dir}/PROSORT/${ims_date}</i> directory

**Step 3.** Unpack the patch file

<pre>
  tar -xzvf <i>${patch_file}.tar.gz</i>
</pre>

  You may notice there are some library files here like so:

<pre>
  patch_file.tar.gz
  prosort/
  libfile1.so
  libfile2.so
</pre>

  If not, ignore **Step 6.**

**Step 4.** Create symbolic link, or delete and replace the prosort folder with a copy from the <i>${patch_file}</i>

  - **Step 4a.** Symbolic link

  <pre>
    cd <i>${PROSORT_HOME}</i>
    cd ..
    unlink prosort
    ln -s ${patch_dir}/PROSORT/${ims_date} prosort
  </pre>

  - **Step 4b.** Create a copy

  <pre>
    cd <i>${PROSORT_HOME}</i>
    cd ..
    rm -r prosort
    cp -r <i>${patch_dir}/PROSORT/${ims_date}/prosort</i> .
  </pre>

**Step 5.** Copy the old license directory to the new patched directory

<pre>
  cp -r <i>${PROSORT_BACKUP}/license ${PROSORT_HOME}</i>
</pre>

**Step 6.** If there are library files, make sure to add them to <i>${OPENFRAME_HOME}/lib</i> directory.

<pre>
  cp <i>${patch_dir}/PROSORT/${ims_date}/prosort/lib* ${OPENFRAME_HOME}/lib/.</i>
</pre>

**Step 7.** Check the current version to ensure that the patch was successful

<pre>
  prosort -v
</pre>

**Step 8.** Test the patch - Did it resolve the issue the patch was created for in the first place?

After applying the patch, the original issue reported in th e IMS ticket should be retested

**Step 9.** Receive confirmation from the customer.

</details>

### OFASM

<details><summary>Steps</summary>

OFASM patches generally come in the form of entire directories, but may also include some library files. In this guide, we will explain how to handle both.

**Step 1.** Unlink the current OFASM directory

<pre>
  cd <i>${OFASM_HOME}</i>
  cd ..
  unlink OFASM
</pre>

**Step 2.** Download the patch to the <i>${patch_dir}/OFASM/${ims_date}</i> directory

**Step 3.** Unpack the patch file

<pre>
  tar -xzvf <i>${patch_file}.tar.gz</i>
</pre>

<pre>
  patch_file.tar.gz
  OFASM/
</pre>

**Step 4.** Create symbolic link, or delete and replace the prosort folder with a copy from the <i>${patch_file}</i>

  - **Step 4a.** Symbolic link

  <pre>
    cd <i>${OFASM_HOME}</i>
    cd ..
    unlink OFASM
    ln -s ${patch_dir}/OFASM/${ims_date} prosort
  </pre>

  - **Step 4b.** Create a copy

  <pre>
    cd <i>${OFASM_HOME}</i>
    cd ..
    rm -r OFASM
    cp -r <i>${patch_dir}/OFASM/${ims_date}/OFASM</i> .
  </pre>

**Step 5.** Copy the old license directory to the new patched directory

<pre>
  cp -r <i>${OFASM_BACKUP}/license ${OFASM_HOME}</i>
</pre>

**Step 6.** Check the current version to ensure that the patch was successful

<pre>
  ofasm -v
</pre>

**Step 7.** Test the patch - Did it resolve the issue the patch was created for in the first place?

After applying the patch, the original issue reported in th e IMS ticket should be retested

**Step 8.** Receive confirmation from the customer.

</details>

### OFPLI

<details><summary>Steps</summary>

  OFPLI patches generally come in the form of full directories

  **Step 1.** Unlink the current OFPLI directory

<pre>
  cd <i>${OFPLI_HOME}</i>
  cd ..
  unlink OFPLI
</pre>

**Step 2.** Download the patch to the <i>${patch_dir}/OFPLI/${ims_date}</i> directory

**Step 3.** Unpack the patch file

<pre>
  tar -xzvf <i>${patch_file}.tar.gz</i>
</pre>

<pre>
  patch_file.tar.gz
  OFPLI/
</pre>

**Step 4.** Create symbolic link, or delete and replace the prosort folder with a copy from the <i>${patch_file}</i>

  - **Step 4a.** Symbolic link

  <pre>
    cd <i>${OFPLI_HOME}</i>
    cd ..
    unlink OFPLI
    ln -s ${patch_dir}/OFPLI/${ims_date} prosort
  </pre>

  - **Step 4b.** Create a copy

  <pre>
    cd <i>${OFPLI_HOME}</i>
    cd ..
    rm -r OFPLI
    cp -r <i>${patch_dir}/OFPLI/${ims_date}/OFPLI</i> .
  </pre>

**Step 5.** Copy the old license directory to the new patched directory

<pre>
  cp -r <i>${OFPLI_BACKUP}/license ${OFPLI_HOME}</i>
</pre>

**Step 6.** Check the current version to ensure that the patch was successful

<pre>
  ofpli --version
</pre>

**Step 7.** Test the patch - Did it resolve the issue the patch was created for in the first place?

After applying the patch, the original issue reported in th e IMS ticket should be retested

**Step 8.** Receive confirmation from the customer.

</details>

### OpenFrame Base / Core(TMAX) / OpenFrame OSI / OpenFrame HiDB / OpenFrame TACF

<details><summary>Steps</summary>

OpenFrame Base / OSI / HiDB / TACF patches generally come in the form of library files and binary files. We can utilize ofpatch.sh to patch these quickly and easily.

_See General Notes section for Patching OpenFrame for instructions with ofpatch.sh_

If you choose not to use ofpatch.sh, you can also manually patch library files, binary files, and utility files the same way.

1. Move the original file to {file_name}.bk{date}

2. Copy the patch file to the correct location
  - Library Files go to $OPENFRAME_HOME/lib
  - Binary Files go to $OPENFRAME_HOME/bin
  - Utility Files go to $OPENFRAME_HOME/util

3. Create a symbolic link from the new file to the original name

Example:
<pre>
  ln -s {patch_file} {original_file}
  Real Example:
  ln -s tmadmin.000001.20190923 tmadmin
</pre>

</details>

### JEUS

### OFMiner

<details><summary>Steps</summary>

  OFMiner patches come in .war files. The current OFMINER_HOME must be backed up before patching. Additionally, the managed server containing OFMiner should be offline while patching, and rebooted afterwards. After patching, some sql queries must be run to update the tables in Tibero which OFMiner uses to store meta data. 

1. Shutdown Jeus Managed Server where OFMiner is deployed

2. Create a backup of the current OFMINER_HOME directory

  <pre>

    cd ${OFMINER_HOME}
    cd ..
    cp -r ${OFMINER_HOME} OFMINER.BK.${DATE}

  </pre>

3. Unzip .war file. 

<pre>

  unzip ${patch_file.war}

</pre>

4. Copy the properties, repository, and license folder from the backup to the newly decompressed OFMiner.

<pre>

  cp -r OFMINER.BK.${DATE}/properties ${OFMINER_HOME}/.
  cp -r OFMINER.BK.${DATE}/repository ${OFMINER_HOME}/.
  cp -r OFMINER.BK.${DATE}/license ${OFMINER_HOME}/.

</pre>

5. Run the DROP, CREATE, INSERT sql queries included with the patch

<pre>

  cd ${OFMINER_HOME}/scripts
  tbsql ${tibero_user}/${tibero_user_password}@DROP.sql
  tbsql ${tibero_user}/${tibero_user_password}@CREATE.sql
  tbsql ${tibero_user}/${tibero_user_password}@INSERT.sql

</pre>

6. Reboot Managed Server 

<pre>

  jeusadmin -u ${jeus_admin} -p ${jeus_password}
  >> startManagedServer -s ${ofminer_server_name}

</pre>

7. Erase your browser's cache.

8. Logon and re-analyze.

</details>

## Tibero