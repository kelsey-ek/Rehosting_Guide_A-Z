Mainframe Rehosting Guide A-Z
==============================
*The purpose of this document is to create a detailed step-by-step plan
for rehosting a mainframe to OpenFrame. This document will describe in
detail the processes needed and complementary scripts and manuals to
quickly, accurately, and successfully migrate a mainframe system to
OpenFrame.*

Table of Contents 
========

[Pre-Migration](#pre-migration)

[Mainframe Environment](#mainframe-environment)

[Migration](#migration)

[Datasets](#datasets)

[Source Code](#source-code)

[Installation](#installation)

[Discovery](#discovery)

[OFMiner](#ofminer)

[Running First Batch JOB](#running-first-batch-job)

Pre-Migration
=============

Mainframe Environment
---------------------

**Description**: This task requires efforts from the project managers,
presales architects, and sales team to understand the environment. A
questionnaire is provided after Introduction from sales team. Inside the
questionnaire, a link is provided to view this as a (potential) customer
would. This information should be shared to the TFS team to prepare the
project manager and VP of TFS for the team required to rehost this
mainframe environment.

To further increase efficiency, some mainframe commands can be run to
determine the mainframe configuration and configure OpenFrame
accordingly. These configurations include, but are not limited to:

-   COBOL Compilation options
  +   Mainframe Command:
      ```
      command
      ```
  +   OpenFrame Command:
      ```
      command
      ```

-   JOB Class configuration
  +   Mainframe Command:
      ```
      command
      ```
  +   OpenFrame Command:
      ```
      command
      ```

-   System Definition configuration
  +   Mainframe Command:
      ```
      command
      ```
  +   OpenFrame Command:
      ```
      command
      ```

-   IMS/CICS Region configuration
  +   Mainframe Command:
      ```
      command
      ```
  +   OpenFrame Command:
      ```
      command
      ```

**Reference Documents: "Post Introduction Questionnaire"**

OpenFrame Environment
----------------------
<h3>Accessing the Linux Server</h3>

**Prerequisities:**

-   Pre-Migration (Mainframe) - Complete

**Description:** This step includes how to access the Linux server. Depending on who built the Linux Server, the steps for completing this will vary.

<h4>Accessing a Linux Server built by TmaxSoft</h4>

**Description:** If the server is built by TmaxSoft, **most likely**, there is no VDI (Virtual Desktop Infrastructure) required. The server can be accessed via PuTTY. Please refer to the Reference Documents. 

**Reference Documents:** "TODO: How To Connect To A Server With PuTTY"

<h4>Accessing a Linux Server on the Customer's Private Network</h4>

**Description:** If the server is built by the customer, they are **most likely** using a private network which must first be accessed via VPN (Virtual Private Network) software such as CISCO Any Connect. Instructions on accessing the server must be provided by the customer. 

<h3>Installation</h3>

**Prerequisites:** 

-   Licensing
-   NDA
-   Server Access

**Reference Documents:
"TmaxSoft\_OpenFrame7\_fix2\_Installation\_V6.22"**

<h4>Verifying Successful Installation</h4>

**Description:** OpenFrame comes equipped with some very basic sample JOBs and transactions that can be run and to test the most basic functionality of OpenFrame. After you install OpenFrame, these tests should be run and marked as completed before going any further to ensure the installation was successful.

**Reference Documents:** "#TODO: How to use tmadmin"

Migration
=========

**Description**: This step includes migrating datasets and source code.
There are multiple options for downloading the data from the mainframe.

**Reference Documents:** "How to Source Code Transfer Process"

Datasets
--------

**Prerequisites**:

**Description**: This task can be completed in parallel to the
Installation and Discovery stages. This task requires a lot of effort
and should be handled by no less than two engineers.

\#TODO: Attach ds\_wrap.sh script (Include awk script, include java
project)

\#TODO: Attach data\_dsmigin.sh script

**Reference Documents:** "data\_dsmigin.sh", "data\_dsmigin.conf",
"ds\_wrap.sh"

Source Code
-----------

**Prerequisites**:

Source code such as JCL, COBOL and other Fixed Block data types of LRECL
80 should be migrated with the -L option in dsmigin

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

Discovery
=========

**Prerequisites**:

-   Migration (Source Code) -- Complete

**Description**: Once the source code is migrated to the OpenFrame
server, the files must be sorted into their respective element types for
analysis (JCL, PROC, COBOL, COPYBOOK, CSD)

OFMiner
-------

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

OpenFrame Configuration
=======================

**Prerequisites:**

-   Migration (Source Code) -- Complete

**Description:** In order for batch JOBs to run correctly, configuration changes must be made environment to environment. Below is a list of the items you will have to modify based on the customer requirements.

- JOBCLASS
    + What: Specifies what a JOB should do when submitted on OpenFrame. (START, HOLD, etc)
    + Where: ${OPENFRAME\_HOME}/config/tjes.conf
    + How: Add a line after the existing JOBCLASS section for additional classes 
    + Example:
    ```
    [JOBCLASS]
    A=START
    B=HOLD
    C=START
    ```

Running First Batch JOB
=======================

**Prerequisites:**

-   Installation -- Complete
-   OpenFrame Configuration - Complete

