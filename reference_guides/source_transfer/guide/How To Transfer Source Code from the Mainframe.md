# How to Transfer Source Code from the Mainframe

_The purpose of this document is to propose options to the customer in migrating the data and source code from the mainframe to the Linux server so it can be migrated into OpenFrame. TmaxSoft recommends transferring all source code to reduce the amount of missing source code during the discovery phase utilizing OFMiner. (Please refer to the "How to create an OFMiner report Guide here: https://github.com/tmaxsoft-us/Rehosting_Guide_A-Z/blob/master/reference_guides/ofminer/guide/How%20To%20Create%20an%20OFMiner%20Report.md ") For the discovery phase, Tmaxsoft requires the JCL, Procedures, COBOL and Copybooks, so these elements should be prioritized in the respective order._
_At the point of transfer, Tmaxsoft recommends putting a code freeze in effect to minimize change of scope, as reanalyzing a new scope can cause longer than expected delays in project timeline. Additionally, any code changes that are required on the mainframe need to be carefully tracked to allow Tmaxsoft to test these code changes before cutover. You will have to speak with the customer about tracking these code changes and making the necessary changes in the OpenFrame environment as well._

## Option 1. SFTP from the mainframe to ON PREMISE Linux server

Tmaxsoft will provide a sample JCL to transfer the source code. The client will have to change the sample IP address provided by TmaxSoft to the IP address of the Linux server, and submit the JCL. This will transfer the files to the IP address provided in the PARM of the JCL. The rehosting team will then need access to the Linux server via virtual machine and or VPN connection credentials. 

<h3>Requirements from Rehosting Team</h3>

- Provide the Sample JCL (See below JCL)
- Provide IP address of Linux Server (if built by Rehosting Team)
- Provide source code destination directory

<h3>Requirements from Customer</h3>

- Gather source code and prepare all in scope libraries for FTP
- Modify JCL to connect to the Linux Server

Below is the aforementioned Sample JCL. In summary what it does is, Connects using the Username and Password provided. It sets the FTP type to ASCII and changes directory on the target server to the modified directory. Then, it changes directory to the PDS specified by the lcd (local change directory) statement. mput * will put everything in the pds on the mainframe to the directory on the target server. 

<i>The customer will have to modify the portions in <b><del>bold strikethrough</del></b> text</i>

1. <b>Modify the Sample JCL

<pre>//USER001  JOB ,CARTER,MSGLEVEL=(1,1)
//FTPSTP1  EXEC PGM=FTP,REGION=2048K,
//             PARM='<b><del>12.23.45.678</del></b> (EXIT TIMEOUT 120'
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//INPUT    DD  *
<b><del>USERNAME</del></b>
<b><del>PASSWORD</del></b>
ascii
prompt
cd '<b><del>destination full directory path</del></b>'
lcd '<b><del>mainframe pds name</del></b>'
mput *
/*
```</pre>

2. Create the target directory structure

To help the rehosting team cut down time on the discovery stage, it is best to transfer all of the source code in a structured manner. TmaxSoft highly recommends sorting the source code by type (JCL, COBOL, ASSEMBLER, etc). Below is an example structure:

- src/JCL
- src/PROC
- src/COBOL
- src/ASSEMBLER
- src/COPYBOOK
- src/DCLGEN
- src/PSB
- src/DBD
- ...

During the discovery stage, OFMiner really only needs JCL, PROC, COBOL, ASSEMBLER, COPYBOOK, so these should be prioritized, but everything else can be transferred in parallel to the discovery stage.

3. Submit the JCL

Since we are transferring Source Code, and not datasets, we can transfer in ascii mode which will allow OFMiner to read the files as regular text. Once the source code is transferred, the rehosting team will begin the discovery stage. 

## Option 2. SCP from ON PREMISE server to OFFSITE Linux server

If the Linux server is off premise (NOT in the customer's private network) there are some additional steps required. <b>First, Option 1 must be completed to an ON SITE FTP server (Any server which can freely FTP outside of the network)</b>. Once the source code is on the FTP server, the files can be SCP'd (Secure Copied) using freewares such as WinSCP or FileZilla.

You can download WinSCP for free here: 

When you open WinSCP, it will ask you for a New Site. Please reference the image below:

![alt text](https://github.com/tmaxsoft-us/Rehosting_Guide_A-Z/blob/master/reference_guides/source_transfer/reference_pictures/new_site.png "New Site")

Once you have created a New Site, fill in the information for connecting to the server. Please reference the image below:

![alt text](https://github.com/tmaxsoft-us/Rehosting_Guide_A-Z/blob/master/reference_guides/source_transfer/reference_pictures/new_session.png "New Session")


