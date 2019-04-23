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

Below is the aforementioned Sample JCL
<pre><i>The customer will have to modify the portions in <b><del>bold strikethrough</del></b> text</i></pre>

<pre>//USER001  JOB ,CARTER,MSGLEVEL=(1,1)
//FTPSTP1  EXEC PGM=FTP,REGION=2048K,
//             PARM='<b><del>12.23.45.678</del></b> (EXIT TIMEOUT 120'
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//INPUT    DD  *
USER
PSSWD
ascii
prompt
cd '<b><del>destination full directory path</del></b>'
lcd '<b><del>mainframe pds name</del></b>'
mput *
/*
```</pre>

