# Mainframe Rehosting Guide A-Z

*The purpose of this document is to create a detailed step-by-step plan
for rehosting a mainframe to OpenFrame. This document will describe in
detail the processes needed and complementary scripts and manuals to
quickly, accurately, and successfully migrate a mainframe system to
OpenFrame. Most importantly, this document aims to be understandable at any level of Mainframe/OpenFrame experience.*

# Table of Contents 

[Pre-Migration](#pre-migration)

[Mainframe Environment](#mainframe-environment)

[Migration](#migration)

[Datasets](#datasets)

[Source Code](#source-code)

[Installation](#installation)

[Discovery](#discovery)

[OFMiner](#ofminer)

[Running First Batch JOB](#running-first-batch-job)

# Pre-Migration


# Mainframe Environment


**Description**: Understanding the mainframe environment is crucial to rehosting it to OpenFrame. Once a customer is interested in rehosting, the technical details are discussed between TmaxSoft and the Customer. TmaxSoft can gather most of the critical information through a questionnaire (TODO: see reference document "Post Introduction Questionnaire"). This initial questionnaire is vital to determining the feasability of rehosting the mainframe to OpenFrame. In almost every case, the customer has most likely changed some configurations to suit their needs. One of the most important tasks to rehosting a mainframe is configuring OpenFrame the same way the mainframe was configured. To do these, we need to have the customer run some commands on the mainframe so we can see the results and adjust OpenFrame accordingly. A few examples are below, but this will be looked into more detail in the Configuration section.

*   COBOL Compilation options

    *   Mainframe Command:
      ```
      command
      ```
    *   OpenFrame Command:
      ```
      command
      ```

*   JOB Class configuration

    *   Mainframe Command:
      ```
      command
      ```
    *   OpenFrame Command:
      ```
      command
      ```

*   System Definition configuration

    *   Mainframe Command:
      ```
      command
      ```
    *   OpenFrame Command:
      ```
      command
      ```

*   IMS/CICS Region configuration

    *   Mainframe Command:
      ```
      command
      ```
    *   OpenFrame Command:
      ```
      command
      ```

**Reference Documents: "Post Introduction Questionnaire"**

# OpenFrame Environment

<h3>Accessing the Linux Server</h3>

**Prerequisities:**

-   Pre-Migration (Mainframe) - Complete

**Description:** This step includes how to access the Linux server. Depending on who built the Linux Server, the steps for completing this will vary.

<h4>Accessing a Linux Server built by Rehosting Team</h4>

**Description:** If the server is built by the rehosting team, **most likely**, there is no VDI (Virtual Desktop Infrastructure) required. The server can be accessed via PuTTY. Please refer to the Reference Documents. However, if access to a VDI is required first, please refer to the "Accessing a Linux Server on the Customer's Private Network" section. 

**Reference Documents:** "TODO: How To Connect To A Server With PuTTY"

<h4>Accessing a Linux Server on the Customer's Private Network</h4>

**Description:** If the server is built by the customer, they are **most likely** using a private network which must first be accessed via VPN (Virtual Private Network) software such as CISCO Any Connect. Instructions on accessing the server must be provided by the customer. 

<h4>Binary Request</h4>

**Prerequisites:** 

  - Pre-Migration (Mainframe) - Complete

  - Accessing the Linux Server - Complete

**Description:** Customer binaries must be requested through IMS. In order to request the binaries, you will need to know some information about the operating system (OS) being used on the linux server. For example, we need to know if we should provide 32 bit or 64 bit binaries.

**Reference Documents:** "TODO: How to request customer Binaries"

<h4>Licensing</h4>

**Prerequisites:** 

  - Pre-Migration (Mainframe) - Complete

  - Accessing the Linux Server - Complete

**Description:** Licenses will have to be issued for the products to fully operate. Production licenses must be requested through the Global Planning Team. For the licenses, we will need to know the hostname of the server, and in some cases we will also need to know how many cpu's are being used on the server. If you want to know what information you will need for each license, you can go to www.technet.tmaxsoft.com, then click on Demo License Request. This will ask you to fill out a form for each license. The required fields will describe what information you need to know to request the binary.

<h3>Installation</h3>

**Prerequisites:** 

-   Binary Request - (Complete)
-   Licensing - (In Progress or Complete)
-   NDA (Non-Disclosure Agreement) - Complete
-   Server Access - (Complete)

**Description:** To install OpenFrame, TmaxSoft has created a guide describing the steps required to install OpenFrame. In some cases, you may need to run different commands based on OS or versions of the software which are all described in the Installation Guide (see Reference Document TmaxSoft\_OpenFrame7\_fix2\_Installation\_V6.22)

**Reference Documents:
"TmaxSoft\_OpenFrame7\_fix2\_Installation\_V6.22"**

<h4>Verifying Successful Installation</h4>

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

## Migration

**Description**: This step includes migrating source code and datasets.
There are multiple options for downloading the data from the mainframe.

Below is the ordered list of the assets you will need to migrate from the mainframe to OpenFrame:

  1. JCL
  2. Procedure (PROC)
  3. COBOL
  4. COPYBOOK
  5. CSD
  6. Datasets
    * NON-VSAM
    * VSAM


**Reference Documents:** "How to Source Code Transfer Process"

# Source Code

**Prerequisites:**

**Description:** Source Code Transfer should begin with JCL as it is the starting point for the JOBs. In many cases, a JCL will EXEC a PROC so the PROCs should also be prioritized. The second priority should be the COBOL programs that are EXEC'd in the JCL and the PROCs. Identifying and transferring COBOL programs may be a recursive task because a COBOL program can call another COBOL program referred to as a submodule. These submodules can also call other submodules, hence the recursiveness of this task. Additionally, COBOL programs can call COPYBOOKS to define the datasets, and these COPYBOOKS can reference other COPYBOOKS. Transferring these, are tertiary priority. You will need all of these elements to complete the Analysis step using OFMiner. Once the Source Code is migrated to OpenFrame, JOBs and Online Transactions can be submitted just as they were on the mainframe. In the mainframe, an edittor is used to modify the source code. In OpenFrame, we have many options. One option is through OFStudio which is TmaxSoft's version of eclipse. This allows you to modify source code and push to a git repository to maintain your source code. Another option would be to use the command line directly and modify the source code through an edittor such as Vi, Vim, or Nano. When migrating Source code, it's important to use the -L option to create the linux new line delimiter. The third option would be to use the spfedit tool which allows you to use mainframe commands to be able to edit a dataset or member of a pds. 

__Note: For US based languages, most can be dsmigin'd with -sosi 6
option. However, if you are working for a Japanese, Korean, Brazilian --
Or any other language that may use sosi characters, Please refer to the
sosi options in the dsmigin command.__

The below information can be found by running the _dsmigin_ command with no arguments:
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

# Datasets

**Prerequisites:**

**Description:** This task can be completed in parallel to the
Installation and Discovery stages. This task requires a lot of effort
and should be handled by no less than two engineers.

\#TODO: Attach ds\_wrap.sh script (Include awk script, include java
project)

\#TODO: Attach data\_dsmigin.sh script

**Reference Documents:** "data\_dsmigin.sh", "data\_dsmigin.conf",
"ds\_wrap.sh"

## Discovery

**Prerequisites:**

-   Migration (Source Code) -- Complete

**Description:** Once the source code is migrated to the OpenFrame
server, the files must be sorted into their respective element types for
analysis (JCL, PROC, COBOL, COPYBOOK, CSD)

# OFMiner

**Prerequisites:**

-   Migration (Source Code) -- Complete

-   Installation -- Complete

**Description**: OFMiner is a tool used for analyzing elements in scope
starting from the JCL. It utilizes the Tmax Base, Batch, TACF, and
Tibero elements to create a detailed document describing what JOBs,
PROCs, Programs (COBOL, Assembler), and Copybooks are in scope for
rehosting. Utilizing TBAdmin is a great tool to help create this
analysis document.

**Reference Documents: "How to create an OFMiner report\_v2"**

## OpenFrame Configuration

**Prerequisites:**

-   Migration (Source Code) -- Complete

**Description:** In order for batch JOBs and Online Transactions to run correctly, configuration changes must be made environment to the environment. Below is a list of the items you may or may not have to modify based on the customer's mainframe configuration:

* cpm.conf

  **Description:** The cpm.conf configuration file contains the settings for conversion process from Mainframe to OpenFrame.
  
* dbutil.conf
* ds.conf
* dstool.conf
* ezaci.conf
* ezplus.conf
* ftp.conf
* hidb.conf
* idcams.conf
* ikjeft01.conf
* ims.conf
* isrsupc.conf
* keyseq.conf
* ofosc.seq
* ofstudio.conf
* ofsys.seq
* osc.OSCOIVP1.conf
* osc.OSCOIVP1TL.conf
* osc.conf
* osc.lu.conf
* osc.region.list
* osc.IMSA.conf
* osi.conf
* osi.ofsys.seq
* osi.ofsys.seq_for_OSI_ONLY
* osi.ofsys.seq_orig
* print.conf
* rc.conf
* saf.conf
* smf.conf
* sms.conf
* sort.conf
* ssm.IMSADB2T.conf
* tacf.conf
* textrun.conf
* tjclrun.conf
* tjes.conf
* tjesmgr.conf
* tso.conf
* unit.conf
* volume.conf
* vtam.conf

- JOBCLASS
    + What: Specifies what a JOB should do when submitted on OpenFrame. (START, HOLD, etc)
    + Where: ${OPENFRAME_HOME}/config/tjes.conf
    + How: Add a line after the existing JOBCLASS section for additional classes 
    + Example:
    ```
    [JOBCLASS]
    A=START
    B=HOLD
    C=START
    ```


## Source Compilation

**Prerequisites:** 

-   Installation -- Complete
-   OpenFrame Configuration -- In Progress or Complete

**Description:** In order to compile source code such as COBOL, Assembler (ASM), PL/I, BMS, MFS, DBDs, PSBs, you will need to first complete some configuration. There are many compiler options available to mainframe, and we need to configure OpenFrame to compile source code the same way it is done on the mainframe. 

## Running Batch JOBs

**Prerequisites:**

-   Installation -- Complete
-   OpenFrame Configuration -- Complete
-   Source Compilation -- Complete

**Description:** Now that your configuration is completed, it's time to start running Batch JOBs. 

## Running Online Transactions

**Prerequisites:** 

-   Installation -- Complete
-   OpenFrame Configuration -- Complete
-   Source Compilation -- Complete

**Description:** Online Transactions can be run through a series of interconnected components: WebTerminal and 3270 Gateway (OFGW). In general, a transaction will be running in an online region in OpenFrame. OFGW will interact and translate the messages flowing through from the webtermanal to the region and visa-versa. The end result is an online screen where users can interact and view, modify, or delete information on the underlying database. 

## JOB Stream and Scheduler

**Prerequisities:**

-   Installation -- Complete
-   OpenFrame Configuration -- Complete
-   Running Batch JOBs -- In Progress or Complete

**Description:** A mainframe scheduler's purpose is to define which and when JOBs will run. Additionally, logic can be added to the scheduler to determine what subsequent JOBs are to be run based on return codes from previous JOBs. Similar to the mainframe, OpenFrame can also work with most schedulers, so JOBs can be run the same way they run on the mainframe.

## Operations & Maintenance

**Prerequisites:**

-   Installation -- Complete
-   OpenFrame Configuration -- Complete
-   Running Batch JOBs -- In Progress or Complete

**Description:** Now that the mainframe has been rehosted to an Open System, you now have the freedom to develop and customize OpenFrame to meet your demands. OpenFrame comes well equipped with many self-managing tools to help organize your environment, while maintaining smooth and reliable operation. In this section, we will go through some useful utilities that OpenFrame comes with by default, and some useful shell scripts to increase efficiency in daily operations.

- Spools

  - Backup

    - auto\_backup\_spool.sh (TODO: Add supporting scripts and Documentation)

  - Restore

- JEUS

  - catdomain (TODO: Add supporting scripts and Documentation)

- BATCH

  - scan\_fix.sh (TODO: Add supporting scripts and Documentation)


