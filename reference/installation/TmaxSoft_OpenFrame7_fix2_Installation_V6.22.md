libtermcap

Installation Instructions

OpenFrame7 fix 2-3

oframe\@ofdemo:/home/oframe /\> ofversion

ofversion version 7.0.2(1) obuild\@tplinux64:ofsrc7/base(\#1) 2016-06-28
16:52:31

Print OpenFrame Version Information

OpenFrame Solution is Covered

\- OpenFrame/Base 7.0 Fix\#2

\- OpenFrame/TACF 7.0 Fix\#2

\- OpenFrame/Batch MVS 7.0 Fix\#2

\- OpenFrame/OSC 7.0 Fix\#2

\- OpenFrame/OFIDMS DC 7.0 Fix\#2

\- OpenFrame/NDBII 1.0

***Prepared by***

***TmaxSoft Inc, USA***

***V6.21ch*** (08152017)

Contents

[I. OpenFrame Installation Checklist.
4](#openframe-installation-checklist.)

[II. Pre-Installation setup 5](#pre-installation-setup)

[III. Pre-Installation setup - Verification
8](#pre-installation-setup---verification)

[IV. Tibero Installation 11](#tibero-installation)

[V. Base 7.0 fix 2 (Core) Installation
16](#base-7.0-fix-2-core-installation)

[1. Creating an ODBC Environment 17](#creating-an-odbc-environment)

[2. Installing OpenFrame 7 fix 2 Base
19](#installing-openframe-7-fix-2-base)

[3. Installation FAQ 21](#installation-faq)

[VI. Batch (TJES 7.0 fix 2) Installation
22](#oframe-batch-tjes-7.0-fix-2-installation)

[VII. TACF 7.0 fix 2 installation 23](#tacf-7.0-fix-2-installation)

[VIII. ProSort installation 25](#prosort-installation)

[IX. Protrieve Installation 27](#protrieve-installation)

[X. OFCOBOL Installation 28](#ofcobol-installation)

[XI. OFPLI Installation 29](#ofpli-installation)

[XII. OFASM Installation 31](#ofasm-installation)

[1. OFASM Compilation 32](#ofasm-compilation)

[2. OFASM Uninstallation 33](#ofasm-uninstallation)

[XIII. Online (OSC 7.0 fix 2) Installation
34](#online-osc-7.0-fix-2-installation)

[XIV. NDBII (for IDMS) Installation 39](#ndbii-for-idms-installation)

[XV. OFIDMS/DC 7.0 fix 2 Installation (Online for IDMS)
41](#ofidmsdc-7.0-fix-2-installation-online-for-idms)

[XVI. JEUS Installation (tar.gz version only)
45](#jeus-installation-tar.gz-version-only)

[1. Sun JDK Installation 45](#sun-jdk-installation)

[2. Ant Installation 45](#ant-installation)

[3. JEUS Installation 46](#jeus-installation)

[4. How to create a server in JEUS7 by duplicating
52](#how-to-create-a-server-in-jeus7-by-duplicating)

[XVII. OFGW Installation 54](#ofgw-installation)

[1. WebTerminal & T3270 Terminal (eg, QWS3270p or RUMBA)
54](#webterminal-t3270-terminal-eg-qws3270p-or-rumba)

[XVIII. OFAdmin Installation 60](#ofadmin-installation)

[XIX. OFMiner Installation 64](#ofminer-installation)

[XX. Other issue cases 71](#other-issue-cases)

[1. Cloned OpenFrame setup -- NEW IP address
71](#cloned-openframe-setup-new-ip-address)

[XXI. Tibero TAC & Clustering Configuration
73](#tibero-tac-clustering-configuration)

[1. Introduction 73](#introduction)

[2. Preparation 74](#preparation)

[3. Installation 76](#installation)

[4. Process Startup and Termination
84](#process-startup-and-termination)

 OpenFrame Installation Checklist.
=================================

-   **Hardware/Software Requirements**

    Below are requirements for setting up a server for OpenFrame
    installation.

+----------+------------------------------------------------+
| Platform | IBM AIX 5.x or 6.x (32 bit, 64-bit)            |
+----------+------------------------------------------------+
|          | HP-UX ia64 11.xx (32 bit, 64-bit)              |
+----------+------------------------------------------------+
|          | HP-UX PA-RISC 11.xx (32 bit, 64-bit)           |
+----------+------------------------------------------------+
|          | Solaris 10 (SunOS 5.9 & 5.10) (32 bit, 64-bit) |
+----------+------------------------------------------------+
|          | Linux x86 2.6 (32 bit, 64-bit)                 |
|          |                                                |
|          | -   Red Hat 7.x                                |
|          |                                                |
|          | -   CentOS 7.x                                 |
+----------+------------------------------------------------+
|          | Linux ia64 2.6 (32 bit, 64-bit)                |
+----------+------------------------------------------------+
| Hardware | Core: 2 (Min)                                  |
+----------+------------------------------------------------+
|          | Memory: 4 GB (Min)                             |
+----------+------------------------------------------------+
|          | Swap space: 1 GB (Min)                         |
+----------+------------------------------------------------+
|          | Hard disk: 30GB (Min)                          |
+----------+------------------------------------------------+

-   **OpenFrame Binaries & License files**

    Customer have to provide output of below commands of the POC server.

<!-- -->

-   uname -a

-   cat /proc/cpuinfo

-   cat /etc/\*-release

-   file /bin/ps

> TmaxSoft would send OpenFrame Binary files & license file within a
> week time, after above results are provided.

-   **Required Software on Customer Laptops**

<!-- -->

-   Winscp

-   Putty

-   Notepad ++

-   Eclipse any version

 Pre-Installation setup
======================

Customer need root access to perform below setup.

-   Group and User creation commands

> \[root\@ofdemo \~ /\]\# **groupadd mqm -g 300**
>
> \[root\@ofdemo \~ /\]\# **groupadd dba -g 305**
>
> \[root\@ofdemo \~ /\]\# **useradd -d /home/oframe -g mqm -s /bin/bash
> -m oframe -u 301**
>
> \[root\@ofdemo \~ /\]\# **useradd -d /home/oftibr -g dba -s /bin/bash
> -m oftibr** **-u 302**

-   Update the passwords for all user accounts

> \[root\@ofdemo \~ /\]\# **passwd oframe**
>
> Changing password for user oframe.
>
> **New password:**
>
> **Retype new password:**
>
> passwd: all authentication tokens updated successfully
>
> \[root\@ofdemo \~ /\]\# **passwd oftibr**
>
> Changing password for user oftibr.
>
> **New password:**
>
> **Retype new password:**
>
> passwd: all authentication tokens updated successfully

-   Grant Read and execute permissions to all users

> \[root\@ofdemo \~home\]\# **cd /home**
>
> \[root\@ofdemo \~home\]\# **chmod -R 755 oftibr**
>
> \[root\@ofdemo \~home\]\# **chmod -R 755 oframe**

-   Create below directory structure for presentation, application, and
    data layers. If possible each directory structure, be setup on
    separate mount points.

> /opt/tmaxapp
>
> /opt/tmaxdb

/opt/tmaxui

/opt/tmaxsw

\[Instructions\]

> Create 4 new folders in /opt, all tmax software will be installed in
> respective directories using individual ids.
>
> **cd /opt**
>
> **mkdir tmaxapp tmaxdb tmaxui tmaxsw**
>
> **chgrp mqm -R tmaxapp tmaxui tmaxsw**
>
> **chgrp dba -R tmaxdb**
>
> **chmod g+w tmaxapp tmaxdb tmaxui tmaxsw**
>
> **chown -R oframe tmaxapp tmaxui tmaxsw**
>
> **chown -R oftibr tmaxdb**

+-----------------------------------------------------------------------+
| -   **How to set up for private key login with oframe (user id)       |
|     through putty or winscp using same private key of centos ID.**    |
|                                                                       |
|     a.  Copy private key from cento to oframe                         |
|                                                                       |
|         **sudo su -**                                                 |
|                                                                       |
|         **cd /home/centos/.ssh**                                      |
|                                                                       |
|         **cp authorized\_keys /home/oframe/.ssh/**                    |
|                                                                       |
|         **cd /home/oframe/.ssh**                                      |
|                                                                       |
|         **chown oframe authorized\_key**                              |
|                                                                       |
|         **exit**                                                      |
|                                                                       |
|     b.  Try connect oframe (user id) with putty or winscp             |
|                                                                       |
| -   **How to add oframe & oftibr (user id) for sudo command without   |
|     password**                                                        |
|                                                                       |
|     c.  Modify system configuration under sudoers.d                   |
|                                                                       |
|         **sudo su --**                                                |
|                                                                       |
|         **cd /etc/sudoers.d**                                         |
|                                                                       |
|         **vi 90-cloud-init-users**                                    |
|                                                                       |
|     d.  Add oframe (user id), save, and get out                       |
|                                                                       |
|         **oframe ALL=(ALL) NOPASSWD:ALL**                             |
|                                                                       |
|         **oftibr All=(ALL) NOPASSWD:ALL**                             |
+-----------------------------------------------------------------------+

+------------------------------------------------------+
| -   **How to disable login with private key file**   |
|                                                      |
|     e.  Modify /etc/ssh/sshd\_config with ROOT id    |
|                                                      |
|         **sudo su -**                                |
|                                                      |
|         **cd /etc/ssh**                              |
|                                                      |
|         **vi sshd\_config**                          |
|                                                      |
|         **PasswordAuthentication yes**               |
|                                                      |
|     f.  Restart ssh service                          |
|                                                      |
|         **service sshd restart**                     |
|                                                      |
|         **exit**                                     |
|                                                      |
| -   **How to change hostname permanently**           |
|                                                      |
|     g.  Modify /etc/sysconfig/network with ROOT id   |
|                                                      |
|         **sudo su -**                                |
|                                                      |
|         **cd /etc/sysconfig**                        |
|                                                      |
|         **vi network**                               |
|                                                      |
|         **HOSTNAME='your hostname'**                 |
|                                                      |
|     h.  Modify /etc/hosts with ROOT id               |
|                                                      |
|         **sudo su -**                                |
|                                                      |
|         **cd /etc/**                                 |
|                                                      |
|         **vi hosts**                                 |
|                                                      |
|         **'IP address & your hostname & localhost'** |
|                                                      |
|         ex. 100.90.1.246 OFdemo localhost            |
+------------------------------------------------------+

-   Update the kernel parameters in /etc/sysctl.conf

> \[root\@ofdemo \~home\]\# **vi /etc/sysctl.conf**
>
> kernel.shmall = 7294967296
>
> kernel.sem = 10000 32000 10000 10000

-   Refresh kernel parameters without reboot

> \[root\@ofdemo \~home\]\# **sysctl -p**

-   Update /etc/hosts file with the actual ip address and host name

    ![](media/image1.png){width="6.302083333333333in"
    height="0.71875in"}

    100.90.1.246 ofdemo ofdemo localhost

> In the above please update with actual hostname.

-   Install required packages

    **yum install -y dos2unix**

> **yum install -y java-1.7.0-openjdk-devel**
>
> **yum install -y glibc**
>
> **yum install -y glibc.i686 glibc.x86\_64**
>
> **yum install -y libaio**
>
> **yum install -y compat-libtermcap** (Refer to the below)
>
> **yum install -y gcc**
>
> **yum install -y gcc-c++**
>
> **yum install -y strace**
>
> **yum install -y ltrace**
>
> **yum install -y gdb**

-   If REDHAT solaris try below

> **yum install glibc-2.17-78.el7.i686**

-   If Centos try below instead of ***compat-libtermcap*** (deprecated)

> **yum install -y ncurses\***
>
> **ln -s /usr/lib64/libncurses.so.5.9 /usr/lib/libtermcap.so**
>
> **ln -s /usr/lib64/libncurses.so.5.9 /usr/lib/libtermcap.so.2**
>
> **yum install vim-enhanced -y**

-   If SUSE (SLES) is used, try below instead of compot-libtermcap

> **ln -s /user/lib64/libncurses++.so.5.9 /user/lib/libtermcap.so**
>
> **ln -s /user/lib64/libncurses++.so.5.9 /user/lib/libtermcap.so.2**

-   Allow loopback access in the server.

    Try below command

    ssh <root@127.0.0.1>

    if this gives error... then do below

    Allow loopback access to the server via 127.0.0.1

    iptables -A INPUT -i lo -j ACCEPT\
    iptables -A OUTPUT -o lo -j ACCEPT

> Note: OpenFrame components uses internal communication via localhost &
> 127.0.0.1, hence we need loopback access via 127.0.0.1 within the
> server.

-   Put all OpenFrame binary files and their license files in
    **/opt/tmaxsw** and **/opt/tmaxsw/oflicense,** respectively.

-   Set ulimit for file open configuration by root user as below,
    (default: 1024)

    If setting value is not enough, user may have "too may open files
    error".

In case that the user name of Openframe user is **oframe**,

> root\@ofdemo:/root /\> **vi /etc/security/limits.conf**
>
> oframe soft nofile 65536
>
> oframe hard nofile 65536
>
> oframe soft nproc unlimited
>
> oframe hard nproc unlimited
>
> oframe soft core unlimited
>
> oframe hard core unlimited

**Since core is set as unlimited, the disk space need to be check
prequently.**

 Pre-Installation setup - Verification
=====================================

After customer has setup the server and completed the pre-installation
setup, follow below steps to verify if the setup is done correctly.

-   Verify all the ID's are setup with same group id and able to login
    to putty with individual id's.

<!-- -->

-   id oframe

-   id oftibr

    **Sample**

> root\@ofdemo:/root /\> id oframe
>
> uid=301(oframe) gid=300(mqm) groups=300(mqm)

-   Verify if Id's have access to tmaxapp, tmaxdb, tmaxui by creating a
    sample file in each of the folders.

<!-- -->

-   Login with oframe and oftibr

> **cd /opt/tmaxapp**
>
> **touch om**
>
> **cd /opt/tmaxdb**
>
> **touch om**
>
> **cd /opt/tmaxui**
>
> **touch om**

-   Verify if all the packages are installed

> yum list dos2unix
>
> yum list java-1.7.0-openjdk-devel
>
> yum list glibc
>
> yum list glibc.i686 glibc.x86\_64
>
> yum list compat-libtermcap
>
> yum list libaio
>
> yum list gcc
>
> yum list gcc-c++
>
> **Sample**
>
> root\@ofdemo \~:/etc /\> yum list dos2unix
>
> Installed Packages
>
> dos2unix.x86\_64 3.1-37.el6

-   Verify if loopback access is provided for the server. Loopback
    access means accessing the server via 127.0.0.1

<!-- -->

-   ssh <oframe@127.0.0.1>

> The above should prompt password, if not you might have issue after
> installation and while booting OpenFrame. Refer common error for more
> info.

-   Verify kernel settings have changed /etc/sysctl.conf, etc/hosts .

![](media/image2.png){width="6.0in" height="4.489583333333333in"}

 Tibero Installation
===================

-   Copy the Tibero software to the Tibero user account

-   Unzip and untar the installer file using **oftibr** user. Move the
    extracted tibero5 directory to home location of oftibr.

+-----------------------------------------------------------------------+
| If Tibero binary is in **/opt/tmaxsw**, it may not be accessible      |
| because of ownership and permission. In that case, you need to change |
| its ownership to **oftibr** with **root** ID.                         |
|                                                                       |
| **su --**                                                             |
|                                                                       |
| \<ROOT password\>                                                     |
|                                                                       |
| **cd /opt/tmaxsw**                                                    |
|                                                                       |
| **chown tibero6-bin-6\_rel\_FS04-linux64-121793-opt-tested.tar.gz     |
| oftibr:dba**                                                          |
|                                                                       |
| **mv tibero6-bin-6\_rel\_FS04-linux64-121793-opt-tested.tar.gz        |
| /opt/tmaxdb/**                                                        |
|                                                                       |
| **exit**                                                              |
|                                                                       |
| **cd /opt/tmaxdb**                                                    |
+-----------------------------------------------------------------------+

**Switch to oftibr id**

-   **tar -zxvf
    tibero6-bin-6\_rel\_FS04-linux64-121793-opt-tested.tar.gz**

    **or**

-   **gzip -d
    tibero6-bin-6\_rel\_FS04-linux64-121793-opt-tested.tar.gz**

    **tar -xvf tibero6-bin-6\_rel\_FS04-linux64-121793-opt-tested.tar**

-   **mv tibero6 /opt/tmaxdb/**

-   **chown -R /opt/tmaxdb/oftibr:dba tibero6**

<!-- -->

-   **Update the "Bash profile" of Tibero user - oftibr**

> HOSTNAME=\`hostname\`
>
> USERID=\`whoami\`
>
> export PS1=\'\${USERID}@\${HOSTNAME}:\${PWD} /\> \'
>
> \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
>
> \#
>
> \# TSAM/TIBERO (or TIBERO VSAM)
>
> \#
>
> \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
>
> TB\_HOME=/opt/tmaxdb/tibero6; export TB\_HOME
>
> TB\_SID=TVSAM; export TB\_SID
>
> SEM\_KEY=148050; export SEM\_KEY
>
> TB\_PROF\_DIR=\$TB\_HOME/bin/prof; export TB\_PROF\_DIR
>
> PATH=\$TB\_HOME/script:\$TB\_HOME/bin:\$TB\_HOME/client/bin:\$PATH;
> export PATH
>
> LD\_LIBRARY\_PATH=\$TB\_HOME/lib:\$TB\_HOME/client/lib:/lib:\$LD\_LIBRARY\_PATH;
> export LD\_LIBRARY\_PATH
>
> LD\_LIBRARY\_PATH\_64=\$TB\_HOME/lib:\$TB\_HOME/client/lib:\$LD\_LIBRARY\_PATH\_64;
> export LD\_LIBRARY\_PATH\_64

-   **Execute** the bash profile

> \[oftibr\@ofdemo \~ \]\$ cd
>
> \[oftibr\@ofdemo \~ \]\$ . .bash\_profile

-   Copy the **Tibero** license file to \$TB\_HOME/license

    **cd \$TB\_HOME/license**

    **ln -s /opt/tmaxsw/oflicense/tibero/license.xml license.xml**

-   Execute the gen\_tip file

    **\[oftibr\@ofdemo \~\]\$ cd /opt/tmaxdb/tibero6/config**

> **\[oftibr\@ofdemo \~ config\]\$ sh gen\_tip.sh**
>
> **Using TB\_SID \"TVSAM\"**
>
> **/opt/tmaxdb/tibero6/config/TVSAM.tip generated**
>
> **/opt/tmaxdb/tibero6/config/psm\_commands generated**
>
> **/opt/tmaxdb/tibero6/client/config/tbdsn.tbr generated.**
>
> **Running client/config/gen\_esql\_cfg.sh**
>
> **Done.**

-   Edit the configuration file

> \[oftibr\@ofdemo \~ config\]\$ **vi TVSAM.tip**
>
> *Modify*
>
> **MAX\_SESSION\_COUNT=120**
>
> *Add new parameters*
>
> **WTHR\_PROC\_CNT=8**
>
> **\_WTHR\_PER\_PROC=15**
>
> **\_STMT\_DD\_CSR\_MODE=N**

-   Modify \$TB\_HOME/client/config/tbdsn.tbr

> Put 127.0.0.1 instead of localhost as below
>
> TVSAM=(
>
> (INSTANCE=(HOST=**127.0.0.1**)
>
> (PORT=8629)
>
> (DB\_NAME=TVSAM)
>
> )
>
> )

-   Delete the directory if it exists

> \[oftibr\@ofdemo \~ database\]\$ **rm -rf
> /opt/tmaxdb/tibero6/database/TVSAM**

-   Run create database script

> \[oftibr\@ofdemo \~ bin\]\$ cd /opt/tmaxdb/tibero6/bin
>
> \[oftibr\@ofdemo \~ bin\]\$ **sh tb\_create\_db.sh**
>
> oftibr\@ofdemo:/opt/tmaxdb/tibero6/bin /\> sh tb\_create\_db.sh
>
> Change core dump dir to /opt/tmaxdb/tibero6/bin/prof.
>
> Listener port = 8629
>
> Tibero 6
>
> TmaxData Corporation Copyright (c) 2008-. All rights reserved.
>
> Tibero instance started up (NOMOUNT mode).
>
> /\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-- newmount sql
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--/
>
> create database character set MSWIN949 national character set UTF16;
>
> /\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--/
>
> Database created.
>
> Change core dump dir to /opt/tmaxdb/tibero6/bin/prof.
>
> Listener port = 8629
>
> Tibero 6
>
> TmaxData Corporation Copyright (c) 2008-. All rights reserved.
>
> Tibero instance started up (NORMAL mode).
>
> /opt/tmaxdb/tibero6/bin/tbsvr
>
> .............................
>
> Creating agent table\...
>
> Done.
>
> For details, check
> /opt/tmaxdb/tibero6/instance/TVSAM/log/system\_init.log.
>
> \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
>
> \* Tibero Database TVSAM is created successfully on Fri Aug 12
> 19:10:43 UTC 2016.
>
> \* Tibero home directory (\$TB\_HOME) =
>
> \* /opt/tmaxdb/tibero6
>
> \* Tibero service ID (\$TB\_SID) = TVSAM
>
> \* Tibero binary path =
>
> \* /opt/tmaxdb/tibero6/bin:/opt/tmaxdb/tibero6/client/bin
>
> \* Initialization parameter file =
>
> \* /opt/tmaxdb/tibero6/config/TVSAM.tip
>
> \*
>
> \* Make sure that you always set up environment variables \$TB\_HOME
> and
>
> \* \$TB\_SID properly before you run Tibero.
>
> \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

+-----------------------------------------------------------------------+
| -   If create\_db.sh has the below error about libaio.so file         |
|                                                                       |
| > oftibr\@ofdemo:/opt/tmaxdb/tibero6/bin /\> tb\_create\_db.sh        |
| >                                                                     |
| > tbsvr: error while loading shared libraries: libaio.so.1: cannot    |
| > open shared object file: No such file or directory                  |
|                                                                       |
| -   Install libaio with yum command (ROOT permission is required)     |
|                                                                       |
| > **sudo su --**                                                      |
| >                                                                     |
| > **yum install -y libaio**                                           |
| >                                                                     |
| > **exit**                                                            |
|                                                                       |
| -   If create\_db.sh has the below error (TBR-2082 and 70004)         |
|                                                                       |
| ![](media/image3.png){width="5.885416666666667in" height="4.0625in"}  |
|                                                                       |
| -   Modify \$TB\_HOME/client/config/tbdns.tbr                         |
|                                                                       |
| > Put 127.0.0.1 instead of localhost as below                         |
| >                                                                     |
| > TVSAM=(                                                             |
| >                                                                     |
| > (INSTANCE=(HOST=**127.0.0.1**)                                      |
| >                                                                     |
| > (PORT=8629)                                                         |
| >                                                                     |
| > (DB\_NAME=TVSAM)                                                    |
| >                                                                     |
| > )                                                                   |
| >                                                                     |
| > )                                                                   |
+-----------------------------------------------------------------------+

-   Shutdown Tibero

> \[oftibr\@ofdemo \~ bin\]\$ **tbdown**
>
> Tibero instance terminated (NORMAL mode).

-   Restart Tibero

> oftibr\@ofdemo:/opt/tmaxdb/tibero6/bin /\> **tbboot**
>
> Change core dump dir to /opt/tmaxdb/tibero6/bin/prof.
>
> Listener port = 8629
>
> Tibero 6
>
> TmaxData Corporation Copyright (c) 2008-. All rights reserved.
>
> Tibero instance started up (NORMAL mode).

-   Create new file /opt/tmaxdb/tibero6/scripts/openframe\_tables.sql
    with the below contents

> \[oftibr\@ofdemo \~\]\$ **vi
> /opt/tmaxdb/tibero6/scripts/openframe\_tables.sql**
>
> create tablespace \"DEFVOL\" datafile \'DEFVOL.dbf\' size 300M
> autoextend on;
>
> create tablespace \"TACF00\" datafile \'TACF00.dbf\' size 100M
> autoextend on;

-   Execute the script to create Tablespaces for DEFVOL and TACF

> \[oftibr\@ofdemo \~ scripts\]\$ **tbsql sys/tibero \<
> /opt/tmaxdb/tibero6/scripts/openframe\_tables.sql**
>
> tbSQL 6
>
> TmaxData Corporation Copyright (c) 2008-. All rights reserved
>
> Connected to Tibero.
>
> Tablespace \'DEFVOL\' created
>
> Tablespace \'TACF00\' created
>
> SQL\> Disconnected.

-   To check if Tibero is up and installed properly.

<!-- -->

-   ps --ef \|grep oftibr

> \@ofdemo /\> **ps -ef \| grep oftibr**
>
> oftibr 26454 1 0 19:12 pts/4 00:00:00 tbsvr -t NORMAL -SVR\_SID TVSAM
>
> oftibr 26456 26454 0 19:12 pts/4 00:00:00 tbsvr\_TBMP -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26457 26454 0 19:12 pts/4 00:00:00 tbsvr\_WP000 -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26458 26454 0 19:12 pts/4 00:00:00 tbsvr\_WP001 -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26459 26454 0 19:12 pts/4 00:00:00 tbsvr\_WP002 -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26460 26454 0 19:12 pts/4 00:00:00 tbsvr\_WP003 -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26461 26454 0 19:12 pts/4 00:00:00 tbsvr\_WP004 -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26462 26454 0 19:12 pts/4 00:00:00 tbsvr\_WP005 -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26463 26454 0 19:12 pts/4 00:00:00 tbsvr\_WP006 -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26464 26454 0 19:12 pts/4 00:00:00 tbsvr\_WP007 -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26465 26454 0 19:12 pts/4 00:00:00 tbsvr\_AGNT -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26466 26454 0 19:12 pts/4 00:00:00 tbsvr\_DBWR -t NORMAL
> -SVR\_SID TVSAM
>
> oftibr 26467 26454 0 19:12 pts/4 00:00:00 tbsvr\_RECO -t NORMAL
> -SVR\_SID TVSAM

-   ipcs --m \| grep oftibr

> 0xb088d12a 327682 oftibr 640 943718400 16

-   tbsql sys/tibero

> \@localhost.localdomain:/home/oftibr /\> tbsql sys/tibero
>
> tbSQL 6
>
> TmaxData Corporation Copyright (c) 2008-. All rights reserved.
>
> Connected to Tibero.
>
> SQL\> select \* from all\_tables;
>
> SQL\> QUIT

 Base 7.0 fix 2 (Core) Installation
==================================

-   Base installation using **oframe** id.

-   Verify if below file exist.

> **base. properties**
>
> **OpenFrame\_Base7\_0\_Linux\_x86\_64.bin**
>
> **unixODBC-2.3.4.tar.gz**

-   Update the bash profile with the Tibero specific information

> export PATH
>
> HOSTNAME=\`hostname\`
>
> USERID=\`whoami\`
>
> export PS1=\'\${USERID}@\${HOSTNAME}:\${PWD} /\> \'
>
> alias ofhome=\'cd \$OPENFRAME\_HOME\'
>
> alias ulog=\'cd \$OPENFRAME\_HOME/log/tmax/ulog\'
>
> alias sysjcl=\'cd \$OPENFRAME\_HOME/volume\_default/SYS1.JCLLIB\'
>
> alias sysload=\'cd \$OPENFRAME\_HOME/volume\_default/SYS1.LOADLIB\'
>
> alias sysproc=\'cd \$OPENFRAME\_HOME/volume\_default/SYS1.PROCLIB\'
>
> alias oscsrc=\'cd \$OPENFRAME\_HOME/osc/oivp\'
>
> alias osisrc=\'cd \$OPENFRAME\_HOME/osi/oivp\'
>
> alias defvol=\'cd \$OPENFRAME\_HOME/volume\_default\'
>
> alias tmaxsw=\'cd /opt/tmaxsw\'
>
> alias tmaxapp=\'cd /opt/tmaxapp/\'
>
> alias tmaxdb=\'cd /opt/tmaxdb\'
>
> alias tmaxui=\'cd /opt/tmaxui\'
>
> \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
>
> \#
>
> \# TSAM/TIBERO (or TIBERO VSAM)
>
> \#
>
> \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
>
> TB\_HOME=/opt/tmaxdb/tibero6; export TB\_HOME
>
> TB\_SID=TVSAM; export TB\_SID
>
> SEM\_KEY=148050; export SEM\_KEY
>
> TB\_PROF\_DIR=\$TB\_HOME/bin/prof; export TB\_PROF\_DIR
>
> PATH=\$TB\_HOME/script:\$TB\_HOME/bin:\$TB\_HOME/client/bin:\$PATH;
> export PATH
>
> LD\_LIBRARY\_PATH=\$TB\_HOME/lib:\$TB\_HOME/client/lib:/lib:\$LD\_LIBRARY\_PATH;
> export LD\_LIBRARY\_PATH
>
> LD\_LIBRARY\_PATH\_64=\$TB\_HOME/lib:\$TB\_HOME/client/lib:\$LD\_LIBRARY\_PATH\_64;
> export LD\_LIBRARY\_PATH\_64
>
> export TB\_NLS\_DATE\_FORMAT=\"YYYY/MM/DD HH24:MI:SS\"
>
> TBMON\_HOME=\$TB\_HOME/tbmon; export TBMON\_HOME
>
> AIXTHREAD\_SCOPE=S; export AIXTHREAD\_SCOPE
>
> TB\_CONN\_TIMEOUT=10; export TB\_CONN\_TIMEOUT
>
> TB\_READ\_TIMEOUT=180; export TB\_READ\_TIMEOUT

-   Execute the bash profile

> \[oframe\@ofdemo \~ \~\]\$ **. .bash\_profile**

Creating an ODBC Environment
----------------------------

> OpenFrame 7 -- Base needs ODBC environment to be setup for
> communicating with TIBERO database. Below are the instructions for the
> same.

-   Verify if unixODBC-2.3.\* is present in software folder, if not
    download from [www.unixodbc.org](http://www.unixodbc.org/)

    **tar -zxvf unixODBC-2.3.4.tar.gz**

    **cd unixODBC-2.3.4**

    **./configure \--prefix=/opt/tmaxapp/unixODBC/
    \--sysconfdir=/opt/tmaxapp/unixODBC/etc**

    **make**

    **make install**

-   Verify if a folder is created in /opt/tmaxapp

> **cd /opt/tmaxapp**

**ls** (there should be unixODBC folder)

-   **Create symbolic link for libodbc.so.1**

    \$ cd /opt/tmaxapp/unixODBC/lib/

    \$ ln -s libodbc.so.2.0.0 libodbc.so.1

-   Add environment variables to .bash\_profile of oframe id

    \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

    \#

    \# ODBC

    \#

    \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#

    export ODBC\_HOME=/opt/tmaxapp/unixODBC

    export PATH=\$ODBC\_HOME/bin:\$PATH

    export LD\_LIBRARY\_PATH=\$ODBC\_HOME/lib:\$LD\_LIBRARY\_PATH

    export ODBCINI=/opt/tmaxapp/unixODBC/etc/odbc.ini

    export ODBCSYSINI=/opt/tmaxapp/unixODBC

-   Configure ODBC configuration files (odbc.ini and odbcinst.ini).

-   odbc.ini(/opt/tmaxapp/unixODBC/etc/odbc.ini) records ODBC driver
    connection information.

> Make below changes to odbc.ini\> from /opt/tmaxapp/unixODBC/etc
>
> \[ODBC Data Sources\]
>
> tibero6 = Tibero6 ODBC driver
>
> \[TVSAM\]
>
> Driver = /opt/tmaxdb/tibero6/client/lib/libtbodbc.so
>
> Description = Tibero ODB:qw!
>
> C driver for Tibero6
>
> DSN = TVSAM
>
> SID = TVSAM
>
> User = tibero
>
> Password = tmax

-   If Tibero is installed in different server (with different IP
    address refer to the other configuration of odbc.ini in Appendix A
    (odbc installation)

<!-- -->

-   Verify if odbc connection is working fine.

    Check the unixODBC version and configuration files.

> Execute \"odbcinst -j\" to check the unixODBC version as well as the
> odbc.ini and odbcinst.ini
>
> locations in DRIVERS and SYSTEM DATA SOURCES respectively.
>
> **oframe\@ofdemo \~:/opt/tmaxapp/unixODBC/etc /\> odbcinst -j**
>
> unixODBC 2.3.4
>
> DRIVERS\...\...\...\...: /opt/tmaxapp/unixODBC/odbcinst.ini
>
> SYSTEM DATA SOURCES: /opt/tmaxapp/unixODBC/odbc.ini
>
> FILE DATA SOURCES..: /opt/tmaxapp/unixODBC/ODBCDataSourcesls
>
> USER DATA SOURCES..: /opt/tmaxapp/unixODBC/etc/odbc.ini
>
> SQLULEN Size\...\....: 8
>
> SQLLEN Size\...\.....: 8
>
> SQLSETPOSIROW Size.: 8

-   Test an ODBC connection.

> Configure the odbc.ini and odbcinst.ini files and then query a table
> by accessing Tibero through ODBC using isql.
>
> **\$ isql -v TVSAM tibero tmax**
>
> oframe\@ofdemo:/home/oframe /\> isql -v TVSAM tibero tmax
>
> +\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--+
>
> \| Connected! \|
>
> \| \|
>
> \| sql-statement \|
>
> \| help \[tablename\] \|
>
> \| quit \|
>
> \| \|
>
> +\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--+
>
> SQL\>

+-----------------------------------------------------------------------+
| If you have "**file not found**" message for libodbc.so.1, type as    |
| follows                                                               |
|                                                                       |
| **\$ cd /opt/tmaxapp/unixODBC/lib/**                                  |
|                                                                       |
| **\$ ln -s libodbc.so.2.0.0 libodbc.so.1**                            |
|                                                                       |
| If you have "**invalid socket file descriptor**" message, check if    |
| Tibero is up                                                          |
+-----------------------------------------------------------------------+

Installing OpenFrame 7 fix 2 Base
---------------------------------

-   Edit the base. properties file as below

    **OPENFRAME\_HOME=/opt/tmaxapp/OpenFrame**

    **TP\_HOST\_NAME=ofdemo**

    **TP\_HOST\_IP=ofdemo**

    **TSAM\_DATABASE=TVSAM**

    **OPENFRAME\_LICENSE\_PATH=/opt/tmaxsw/oflicense/ofbatch**

    **TMAX\_LICENSE\_PATH=/opt/tmaxsw/oflicense/tmax**

-   Execute the installer using the properties file

> \[oframe\@ofdemo \~ Downloads\]\$**sh
> OpenFrame\_Base7\_0\_Linux\_x86\_64.bin -f base.properties**
>
> Preparing to install\...
>
> Extracting the JRE from the installer archive\...
>
> Unpacking the JRE\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environmenttm\...
>
> Launching installer\...
>
> Preparing SILENT Mode Installation\...
>
> ===============================================================================
>
> OpenFrame\_Base7\_0 (created with InstallAnywhere by Macrovision)
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> ===============================================================================
>
> Installing\...
>
> \-\-\-\-\-\-\-\-\-\-\-\--
>
> \[==================\|==================\|==================\|==================\]
>
> \[\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\]
>
> Installation Complete.

-   Execute the bash profile

> \[oframe\@ofdemo \~ \]\$ **. .bash\_profile**

-   Copy the license files or make a symbolic link

<!-- -->

-   **cd /opt/tmaxapp/OpenFrame/core/license**

> **cp /opt/tmaxsw/oflicense/tmax/license.dat .**
>
> or

-   **cd /opt/tmaxapp/OpenFrame/core/license**

> **ln -s /opt/tmaxsw/oflicense/tmax/license.dat .**

-   Replace the password with in /home/oframe/.tacfpass

    F2A136C2D7348F01F1681D0A080EDEE944DFCB714B5038F512A08B202ECBD810

-   Shutdown base using tmdown

> \[oframe\@ofdemo \~\]\$ **tmdown**

-   Since we have said YES for creating system files in base.properties,
    we needn't execute the scripts manually. Verify the script output
    log and run the below scripts if required

> **cd /opt/tmaxapp/OpenFrame/scripts**
>
> **\[oframe\@ofdemo \~ script\]\$ link\_lib.sh ./link.log**
>
> **\[oframe\@ofdemo \~ script\]\$ create\_mascat ./mascat.log**
>
> **\[oframe\@ofdemo \~ script\]\$ create\_voladd voladd.log**
>
> **\[oframe\@ofdemo \~ script\]\$ create\_lockds lockds.log**
>
> **\[oframe\@ofdemo \~ script\]\$ boot.sh boot.log**

-   Verification

<!-- -->

-   Use tmadmin and verify status using si command. If any processes as
    NRDY as status then stop the installation and review the logs.

-   Tmadmin

> oframe\@ofdemo \~:/opt/tmaxapp/tmaxsw /\> tmadmin
>
> \-\-- Welcome to Tmax Admin (Type \"quit\" to leave) \-\--
>
> \$\$1 NODE1 (tmadm): si
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> clh svrname (svri) status count qcount qpcount emcount
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> 0 ofrsasvr ( 4) RDY 0 0 0 0
>
> 0 ofrlhsvr ( 5) RDY 0 0 0 0
>
> 0 ofrdmsvr ( 6) RDY 0 0 0 0
>
> 0 ofrdsedt ( 7) RDY 0 0 0 0
>
> 0 ofrcmsvr ( 8) RDY 0 0 0 0
>
> 0 ofruisvr ( 9) RDY 0 0 0 0
>
> 0 ofrsmlog ( 10) RDY 0 0 0 0
>
> 0 vtammgr ( 11) RDY 0 0 0 0

-   Shutdown base using tmdown

> \[oframe\@ofdemo \~ \~\]\$ **tmdown**
>
> Do you really want to down whole Tmax? (y : n): **y**
>
> TMDOWN for node(NODE1) is starting:
>
> TMDOWN: SERVER(ofrdsedt:40) downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: SERVER(ofrsasvr:36) downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: SERVER(ofrdmsvr:39) downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: SERVER(ofrlmsvr:37) downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: SERVER(ofrlmwrk:38) downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: SERVER(ofrcmsvr:41) downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: SERVER(ofruisvr:42) downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: SERVER(ofrsmlog:43) downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: CLL downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: CLH downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: TLM downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: TMM downed: Mon Jan 19 15:24:32 2015
>
> TMDOWN: TMAX is down

Installation FAQ
----------------

-   If you have the below error message in
    **\$OPENFRAME\_HOME/UninstallerData/log/install\_base.log**

    create\_lockds START

    lockds: ams\_initialize() error: -4021

    lockds: ofcom\_conf\_get\_value(USERNAME) error: -22004

\[Solution\]

> Check the configuration of **\[TVSAM\_CLIENT\]** or
> **\[SYS1\_CLIENT\]**
>
> in ds.conf under \$OPENFRAME\_HOME/config**.**

-   If **obmjinit** is not ready (RDY) in tmadmin, check license file

-   If you have the below error

> oframe\@ofdemo:/opt/tmaxapp/OpenFrame/core/license /\> tmboot
>
> \(F) BOOT0010 file open error :
> /opt/tmaxapp/OpenFrame/core/config/tmconfig \[COM1508\]: No such file or
> directory

\[solution\]

> Run CFL
>
> **cd /opt/tmaxapp/OpenFrame/core/config**
>
> **cfl -i oframe.m**

-   If you have below message, check the solution (reported from SUSE
    Linux)

> oframe\@tibero:/opt/tmaxapp/OpenFrame/lib /\> tmadmin
>
> tmadmin: error while loading shared libraries: libtermcap.so.2: cannot
> open shared object file: No such file or directory

\[Solution\]

> Check if libncurses is installed as prerequisite.
>
> If it is, try below...
>
> **cd /opt/tmaxapp/OpenFrame/lib**
>
> **ln -s /usr/lib/libtermcap.so .**
>
> **ln -s /usr/lib/libtermcap.so.2 .**

oframe Batch (TJES 7.0 fix 2) Installation
==========================================

-   Batch installation using oframe id.

-   Verify if below file exist.

> **batch.properties**
>
> **OpenFrame\_Batch7\_0\_Fix2\_ MVS\_Linux\_x86\_64.bin**

-   Copy the license files or make a symbolic link

<!-- -->

-   **cd /opt/tmaxapp/tmaxsw/oflicense/batch**

> **cp lictjes.dat /opt/tmaxapp/OpenFrame/license**
>
> or

-   **cd /opt/tmaxapp/OpenFrame/license**

> **ln -s /opt/tmaxapp/ofsw/**ofl**icense/batch/lictjes.dat
> lictjes.dat**
>
> Take a backup of core configuration file (oframe.m)
>
> cp oframe.m oframe\_base.m

-   Modify the batch install properties file.

> **vi /opt/ofapp/ofsw/batch.properties**
>
> OPENFRAME\_HOME=/opt/tmaxapp/OpenFrame
>
> TJES\_DATABASE=TVSAM

-   Execute the installer by passing the parameter file

> **./OpenFrame\_Batch7\_0\_Fix2\_ MVS\_Linux\_x86\_64.bin -f
> batch.properties**
>
> Preparing to install\...
>
> Extracting the JRE from the installer archive\...
>
> Unpacking the JRE\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> Preparing SILENT Mode Installation\...
>
> ===============================================================================
>
> OpenFrame\_Batch7\_0\_Fix2\_MVS (created with InstallAnywhere by
> Macrovision)
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> ===============================================================================
>
> Installing\...
>
> \-\-\-\-\-\-\-\-\-\-\-\--
>
> \[==================\|==================\|==================\|==================\]
>
> \[\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\]
>
> Installation Complete.
>
> oframe\@tmaxdemo:/opt/ofapp/ofsw /\>

-   Verify the installation by checking the install logs

> **cd /opt/tmaxapp/OpenFrame/UninstallerData/log**
>
> **vi install\_batch.log**
>
> **vi OpenFrame\_Batch7\_0\_Fix2\_ MVS\_InstallLog.log**

-   tmboot

-   tmadmin, si quit

> \$\$1 NODE1 (tmadm): si
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> clh svrname (svri) status count qcount qpcount emcount
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> 0 ofrsasvr ( 4) RDY 0 0 0 0
>
> 0 ofrlhsvr ( 5) RDY 0 0 0 0
>
> 0 ofrdmsvr ( 6) RDY 0 0 0 0
>
> 0 ofrdsedt ( 7) RDY 0 0 0 0
>
> 0 ofrcmsvr ( 8) RDY 0 0 0 0
>
> 0 ofruisvr ( 9) RDY 0 0 0 0
>
> 0 ofrsmlog ( 10) RDY 0 0 0 0
>
> 0 vtammgr ( 11) RDY 0 0 0 0
>
> 0 obmjmsvr ( 12) RDY 0 0 0 0
>
> 0 obmjschd ( 13) RDY 1 0 0 0
>
> 0 obmjinit ( 14) RDY 2 0 0 0
>
> 0 obmjhist ( 15) RDY 0 0 0 0
>
> 0 obmjspbk ( 16) RDY 0 0 0 0
>
> 0 ofrpmsvr ( 17) RDY 0 0 0 0

 TACF 7.0 fix 2 installation 
============================

-   TACF installation using oframe id.

-   Verify if below file exist.

    **OpenFrame\_Tacf7\_0\_Fix2\_Linux\_x86\_64.bin**

    **tacf.properties**

-   Copy the license files or make a symbolic link

<!-- -->

-   **cd /opt/tmaxapp/OpenFrame/license**

> **cp /opt/tmaxsw/oflicense/tacf/lictacf.dat .**
>
> or

-   **cd /opt/tmaxapp/OpenFrame/license**

> **ln -s /opt/tmaxsw/oflicense/tacf/lictacf.dat .**
>
> Take a backup of core configuration file (oframe.m)
>
> cp oframe.m oframe\_base\_batch.m

-   Edit tacf**.**properties

> **vi /opt/tmaxsw/tacf.properties**
>
> OPENFRAME\_HOME=/opt/tmaxapp/OpenFrame
>
> TACF\_DATABASE=TVSAM

-   Run the installer by passing the file as parameter

> oframe\@ofdemo:/opt/tmaxsw /\>
> **./OpenFrame\_Tacf7\_0\_Fix2\_Linux\_x86\_64.bin -f tacf.properties**
>
> Preparing to install\...
>
> Extracting the JRE from the installer archive\...
>
> Unpacking the JRE\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> Preparing SILENT Mode Installation\...
>
> ===============================================================================
>
> OpenFrame\_Tacf7\_0\_Fix2\_NDB2 (created with InstallAnywhere by
> Macrovision)
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> ===============================================================================
>
> Installing\...
>
> \-\-\-\-\-\-\-\-\-\-\-\--
>
> \[==================\|==================\|==================\|==================\]
>
> \[\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\]

-   Tmboot

-   Tmadmin

> oframe\@ofdemo:/opt/tmaxapp/OpenFrame/license /\> tmadmin
>
> \-\-- Welcome to Tmax Admin (Type \"quit\" to leave) \-\--
>
> \$\$1 NODE1 (tmadm): si
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> clh svrname (svri) status count qcount qpcount emcount
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> 0 ofrsasvr ( 4) RDY 0 0 0 0
>
> 0 ofrlhsvr ( 5) RDY 0 0 0 0
>
> 0 ofrdmsvr ( 6) RDY 0 0 0 0
>
> 0 ofrdsedt ( 7) RDY 0 0 0 0
>
> 0 ofrcmsvr ( 8) RDY 0 0 0 0
>
> 0 ofruisvr ( 9) RDY 0 0 0 0
>
> 0 ofrsmlog ( 10) RDY 0 0 0 0
>
> 0 vtammgr ( 11) RDY 0 0 0 0
>
> 0 obmjmsvr ( 12) RDY 0 0 0 0
>
> 0 obmjschd ( 13) RDY 1 0 0 0
>
> 0 obmjinit ( 14) RDY 2 0 0 0
>
> 0 obmjhist ( 15) RDY 0 0 0 0
>
> 0 obmjspbk ( 16) RDY 0 0 0 0
>
> 0 ofrpmsvr ( 17) RDY 0 0 0 0
>
> 0 obmtsmgr ( 18) RDY 0 0 0 0
>
> 0 tmsvr ( 19) RDY 0 0 0 0
>
> \$\$2 NODE1 (tmadm):
>
> Take a backup of core configuration file (oframe.m)
>
> cp oframe.m oframe\_base\_batch\_tacf.m

 ProSort installation 
=====================

-   Verify if below file exist

    **prosort-bin-prosort\_2sp3-linux64-2123-opt.tar.gz**

-   Copy the installer and unzip the file

    oframe\@ofdemo:/opt/tmaxsw /\> **tar -zxvf**
    **prosort-bin-prosort\_2sp3-linux64-2123-opt.tar.gz**

-   Move the prosort directory to home location

    oframe\@ofdemo:/opt/tmaxsw /\> **mv prosort /opt/tmaxapp**

-   Create license directory and copy the license file

    oframe\@ofdemo:/opt/tmaxsw /\> **cd /opt/tmaxapp/prosort**

    oframe\@ofdemo:/opt/tmaxapp/prosort /\> **mkdir license**

    oframe\@ofdemo:/opt/tmaxapp/prosort /\> **cd license**

    oframe\@ofdemo:/opt/tmaxapp/prosort/lincense /\> **ln -s
    /opt/tmaxsw/oflicense/prosort/license.xml .**

-   Update the bash profile of the batch userid

> oframe\@ofdemo:/opt/tmaxapp/prosort/license /\> **cd**
>
> oframe\@ofdemo \~ \> **vi .bash\_profile**
>
> \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
>
> \#
>
> \# PROSORT
>
> \#
>
> \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
>
> PROSORT\_HOME=/opt/tmaxapp/prosort
>
> PROSORT\_SID=gbg
>
> PATH=\$PATH:\$PROSORT\_HOME/bin
>
> LD\_LIBRARY\_PATH=\$PROSORT\_HOME/lib:\$LD\_LIBRARY\_PATH
>
> LIBPATH=\$PROSORT\_HOME/lib:\$LIBPATH
>
> export PROSORT\_HOME PROSORT\_SID PATH LD\_LIBRARY\_PATH LIBPATH
>
> PATH=\$PATH:\$OPENFRAME\_HOME/shbin
>
> export PATH

-   Execute the bash profile

> oframe\@ofdemo \~ \>**. .bash\_profile**

-   Create tip file

> oframe\@ofdemo \~ \>**cd /opt/tmaxapp/prosort/config**
>
> oframe\@ofdemo /opt/opt/tmaxapp/presort/config\~ \> **./gen\_tip.sh**
>
> Using PROSORT\_SID \"gbg\"
>
> /opt/tmaxapp/prosort/config/gbg.tip generated

-   Verify by executing below command

> oframe\@thor:/user/oframe/prosort/config\>**prosort -h**
>
> Usage: prosort \[options\] \[sort script files\]
>
> options
>
> \-\-\-\-\-\--
>
> -h Display this information
>
> -v Display version information
>
> -s Display state information
>
> -j Display profile information
>
> -x Use SyncSort compatible mode

-   Create the symbolic for SORT

oframe\@ofdemo :/opt/tmaxapp/OpenFrame/util/\>ln -s DFSORT SORT

 Protrieve Installation
======================

-   Switch user to oframe

-   Execute the installer file with oframe userid

> **./ProTrieve2\_1\_Linux\_x86\_64.bin**
>
> oframe\@ofdemo:/opt/tmaxsw /\> ./ProTrieve2\_1\_Linux\_x86\_64.bin
>
> Preparing to install\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> Preparing CONSOLE Mode Installation\...
>
> ===============================================================================
>
> ProTrieve (created with InstallAnywhere by Macrovision)
>
> **Enter**
>
> **Enter**
>
> **Enter**
>
> **Y**
>
> **/opt/tmaxapp/protrieve**
>
> **Y**
>
> **enter**

-   Execute the bash profile to update the environment variables

    oframe\@ofdemo \~ \>**. .bash\_profile**

-   Copy the license file to the \$PROTRIEVE\_HOME/license directory.

    oframe\@ofdemo:/opt/tmaxapp/protrieve/license /\> **ln -s
    /opt/tmaxsw/oflicense/protrieve/licprot.dat licprot.dat**

-   Verify the installation by executing protp --v

    oframe\@tmax:/opt/tmaxapp/protrieve/bin /\> **protp -v**

    ProTrieve 2.1

    Copyright (C) 2009 TMAXSOFT RESERVED

-   In the directory \$OPENFRAME\_HOME/config, create a backup of the
    file **tjclrun.conf**.

-   Open the file tjclrun.conf and add the part
    '\${PROTRIEVE\_HOME}/lib' to the LIB\_PATH variable

> Before:

LIB\_PATH=\${OPENFRAME\_HOME}/lib:\${OPENFRAME\_HOME}/core/lib64:\${TB\_HOME}/client/lib:\${COBDIR}/lib:/usr/lib:/lib:/usr/local/lib:\${PROSORT\_HOME}/lib:\${OFCOBOL\_HOME}/lib:\${OFASM\_HOME}/lib:\${OFPLI\_HOME}/lib

> After:

LIB\_PATH=\${OPENFRAME\_HOME}/lib:\${OPENFRAME\_HOME}/core/lib64:\${TB\_HOME}/client/lib:\${COBDIR}/lib:/usr/lib:/lib:/usr/local/lib:\${PROSORT\_HOME}/lib:\${OFCOBOL\_HOME}/lib:\${OFASM\_HOME}:\${OFPLI\_HOME}/lib:\${PROTRIEVE\_HOME}/lib

-   In the same file, add the part '\${PROTRIEVE\_HOME}/bin' to the
    BIN\_PATH variable

> Before:

BIN\_PATH=\${OPENFRAME\_HOME}/bin:\${OPENFRAME\_HOME}/util:\${COBDIR}/bin:/usr/local/bin:
/bin

> After:

BIN\_PATH=\${OPENFRAME\_HOME}/bin:\${OPENFRAME\_HOME}/util:\${COBDIR}/bin:/usr/local/bin:/bin:\${PROTRIEVE\_HOME}/bin

-   Save the file and quit.

-   Boot the OpenFrame system.

 OFCOBOL Installation
====================

 {#section .ListParagraph}

-   Copy the installer file to ofcobol/Downloads directory

-   Switch user to **oframe**

-   Change the Installer file permission

    oframe\@ofdemo:/opt/tmaxsw /\> **chmod a+x
    OpenFrame\_COBOL3\_0\_40\_Linux\_x86\_64.bin**

-   Execute the installer file

> oframe\@ofdemo:/opt/tmaxsw /\>
> **./OpenFrame\_COBOL3\_0\_40\_Linux\_x86\_64.bin**
>
> Preparing to install\...
>
> Extracting the JRE from the installer archive\...
>
> Unpacking the JRE\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> Congratulations. OpenFrame\_COBOL has been successfully installed to:
>
> **ENTER**
>
> **ENTER**
>
> **ENTER**
>
> **Y**
>
> **/opt/tmaxapp/OFCOBOL**
>
> **Y**

-   Execute the bash profile to update the environment variables

    oframe\@ofdemo:/home/oframe /\> . .bash\_profile

> oframe\@ofdemo:/home/oframe /\>cd
>
> Add below line in .bash\_profile
>
> OFCOB\_HOME=\$OFCOBOL\_HOME
>
> export OFCOB\_HOME
>
> oframe\@ofdemo:/home/oframe /\>**. .bash\_profile**

-   Copy the license file

    oframe\@ofdemo:/opt/tmaxapp/OFCOBOL /\> **mkdir license**

    oframe\@ofdemo:/opt/tmaxapp/OFCOBOL /\> **cd license/**

    oframe\@ofdemo:/opt/tmaxapp/OFCOBOL/license /\> **ln -s
    /opt/tmaxsw/oflicense/ofcobol/licofcob.dat .**

-   Verify the installation by executing ofcob

> oframe\@ofdemo:/home/oframe /\> **ofcob \--version**
>
> OpenFrame COBOL Compiler 3.0.54
>
> CommitTag:: 645f3f6bf7fbe1c366a6557c55b96c48454f4bf7

-   In the directory \$OPENFRAME\_HOME/config, create a backup of the
    file **tjclrun.conf**.

Open the file tjclrun.conf and add the part '\${OFPLI\_HOME}/lib' to the
LIB\_PATH variable

> LIB\_PATH=\${OPENFRAME\_HOME}/lib:
> **:\${OFCOB\_HOME}/lib**:\${ODBC\_HOME}/lib

Save the file and quit.

 OFPLI Installation
==================

-   Switch user to **oframe**

-   Change the Installer file permission

    oframe\@ofdemo:/opt/tmaxsw /\> **chmod a+x
    OpenFrame\_PLI2\_0\_Linux\_x86\_64.bin**

    -   Execute the installer file

> oframe\@ofdemo:/opt/tmaxsw /\>
> ./OpenFrame\_PLI2\_0\_Linux\_x86\_64.bin
>
> Preparing to install\...
>
> Extracting the JRE from the installer archive\...
>
> Unpackine g the JRE\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> **ENTER**
>
> **ENTER**
>
> **ENTER**
>
> **Y**
>
> **/opt/tmaxapp/OFPLI**
>
> **Y**

-   Execute the bash profile to update the environment variables

    oframe\@ofdemo:/home/oframe /\> . .bash\_profile

-   Execute the bash profile to update the environment variables

> oframe\@ofdemo:/home/oframe /\>**. .bash\_profile**

-   Copy the license file

    oframe\@ofdemo:/opt/tmaxapp /\> cd /opt/tmaxapp/OFPLI/license

    oframe\@ofdemo:/opt/tmaxapp/OFPLI/license /\> ln -s
    /opt/tmaxsw/oflicense/ofpli/licofpli.dat .

-   Verify the installation by executing ofpli --version

    oframe\@ofdemo:/opt/tmaxsw /\> ofpli \--version

    OpenFrame PL/I Compiler v2.0

    Revision: 1436

    CommitID: 1fdb668

-   In the directory \$OPENFRAME\_HOME/config, create a backup of the
    file **tjclrun.conf**.

    Open the file tjclrun.conf and add the part '\${OFPLI\_HOME}/lib' to
    the LIB\_PATH variable

> **Before:**

LIB\_PATH=\${OPENFRAME\_HOME}/lib:\${OPENFRAME\_HOME}/core/lib64:\${TB\_HOME}/client/lib:\${COBDIR}/lib:/usr/lib:/lib:/usr/local/lib:\${PROSORT\_HOME}/lib:\${OFCOBOL\_HOME}/lib

> **After:**

LIB\_PATH=\${OPENFRAME\_HOME}/lib:\${OPENFRAME\_HOME}/core/lib64:\${TB\_HOME}/client/lib:\${COBDIR}/lib:/usr/lib:/lib:/usr/local/lib:\${PROSORT\_HOME}/lib:\${OFCOBOL\_HOME}/lib:\${OFPLI\_HOME}/lib

Save the file and quit.

-   Boot the OpenFrame system.

 OFASM Installation
==================

-   Switch to oframe id.

-   Execute the installer file

> **oframe\@ofdemo:/opt/tmaxsw /\>
> ./OpenFrame\_ASM3\_0\_Linux\_x86\_64.bin**
>
> Preparing to install\...
>
> Extracting the JRE from the installer archive\...
>
> Unpacking the JRE\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> **ENTER**
>
> **ENTER**
>
> **ENTER**
>
> **Y**
>
> **/opt/tmaxapp/OFASM**
>
> **Y**

-   Execute the bash profile to update the environment variables

> **\[oframe\@tmaxof7\]\$ . .bash\_profile**

-   Verify the installation by executing ofasm --version

    oframe\@ofdemo:/opt/tmaxsw /\> ofasm \--version

    \# TmaxSoft OpenFrame Assembler v3 r306
    (01280fdad0c9f3a6b6e353f035ed14422386ddd7)

-   Add below path to LIB\_PATH environment variable in tjclrun.conf

> Log in using oframe id.
>
> Go to \$OPENFRAME\_HOME/conf
>
> Take tjclrun.conf backup
>
> Edit tjclrun.conf by adding the part '\${OFASM\_HOME}' to the
> LIB\_PATH variable
>
> **Before:**

LIB\_PATH=\${OPENFRAME\_HOME}/lib:\${OPENFRAME\_HOME}/core/lib64:\${TB\_HOME}/client/lib:\${COBDIR}/lib:/usr/lib:/lib:/usr/local/lib:\${PROSORT\_HOME}/lib:\${OFCOBOL\_HOME}/lib:\${OFPLI\_HOME}/lib

> **After:**

LIB\_PATH=\${OPENFRAME\_HOME}/lib:\${OPENFRAME\_HOME}/core/lib64:\${TB\_HOME}/client/lib:\${COBDIR}/lib:/usr/lib:/lib:/usr/local/lib:\${PROSORT\_HOME}/lib:\${OFCOBOL\_HOME}/lib:\${OFPLI\_HOME}/lib:\${OFASM\_HOME}/lib

-   Reboot Openframe environment by

> **tmdown/tmboot** or **oscdown/oscboot**

OFASM Compilation 
------------------

ASSEMBLER COMPILE COMMANDS

> **Step 1:**
>
> Assembler preprocessor:
>
> ofasmpp -i LS646.asm -o LS646.asmi
>
> or
>
> ofasm -E LS646.asm
>
> **Step 2:**
>
> assembler compile :
>
> ofasma -i LS646.asmi -o LS646.asmo
>
> or
>
> ofasm -S LS646.asmi
>
> **Step 3:**
>
> Interface Module :
>
> ofasmif -i LS646.json (Manually create \*.json file)
>
> Output: LS646\_interface.cpp
>
> **Step 4:**
>
> Build Shared Object:
>
> g++ -shared -fPIC -g -o LS646 LS646\_interface.cpp -L\$OFASM\_HOME/lib
> -lofasmVM
>
> output: LS646
>
> **Step 5:**
>
> Copy the asm executable & Shared object to loadlib
>
> cp LS646.asmo LS646 \$OPENFRAME\_HOME/volume\_default/SYS1.LOADLIB
>
> **Step 6:**
>
> Run the Job.
>
> Note:
>
> The call graph from tjes to LS646.asmo is as below
>
> **tjes-\>LS646(interface)-\>ofasmVM-\>LS646.asmo**
>
> asmo file only can be recognized by ofasmVM, so to run asmo file, we
> have to call ofasmVM through assembler interface, the assembler
> interface can be recognized as linux shared object.

OFASM Uninstallation
--------------------

1.  Change the current directory to the below directory.

    a.  /opt/tmaxapp/ofasm/UninstallerData

2.  Run the OFASM uninstaller file.

    b.  ./Uninstall\_OFASM

3.  Press the 'Enter' key once when prompted to continue with the
    uninstallation.

4.  Remove the part ':\${OFASM\_HOME}/lib' from the LIB\_PATH variable.

    c.  Before:

        LIB\_PATH=\${OPENFRAME\_HOME}/lib:\${OPENFRAME\_HOME}/core/lib64:\${TB\_HOME}/client/lib:\${COBDIR}/lib:/usr/lib:/lib:/usr/local/lib:\${PROSORT\_HOME}/lib:\${OFPLI\_HOME}/lib:\${OFASM\_HOME}/lib:\${OFCOB\_HOME}/lib

    d.  After:

        LIB\_PATH=\${OPENFRAME\_HOME}/lib:\${OPENFRAME\_HOME}/core/lib64:\${TB\_HOME}/client/lib:\${COBDIR}/lib:/usr/lib:/lib:/usr/local/lib:\${PROSORT\_HOME}/lib:\${OFPLI\_HOME}/lib:\${OFCOB\_HOME}/lib

        ![](media/image4.png){width="5.645833333333333in"
        height="3.4375in"}

 Online (OSC 7.0 fix 2) Installation
===================================

-   Compiler solutions or other utilities need to be installed before
    the installation of Online starts.

-   Shutdown base using tmdown

> \[oframe\@tmaxof7 \~\]\$ **tmdown**

-   Copy the license files for osc

> \[oframe\@tmaxof7 \~\]\$ **cd /opt/tmaxapp/OpenFrame/license**
>
> oframe\@ofdemo:/opt/tmaxapp/OpenFrame/license /\> ln -s
> /opt/tmaxsw/oflicense/ofonline/licosc.dat .

-   Modify the osc.properties file for the below parameters

> OPENFRAME\_HOME=/opt/tmaxapp/OpenFrame
>
> TSAM\_DATABASE=TVSAM
>
> OSC\_SYS\_OSC\_NCS\_PATH=/opt/tmaxapp/OpenFrame/temp/OSC\_NCS
>
> OSC\_APP\_OSC\_TC\_PATH=/opt/tmaxapp/OpenFrame/temp/OSC\_TC

-   Execute the installer by passing the parameter file

> oframe\@ofdemo:/opt/tmaxsw /\>
> ./OpenFrame\_OSC7\_0\_Fix2\_Linux\_x86\_64.bin -f osc.properties
>
> oframe\@tmaxdemo:/opt/tmaxsw /\>
> **OpenFrame\_OSC7\_0\_Fix2\_Linux\_x86\_64.bin -f osc.properties**
>
> Preparing to install\...
>
> Extracting the JRE from the installer archive\...
>
> Unpacking the JRE\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> Preparing SILENT Mode Installation\...
>
> ===============================================================================
>
> OpenFrame\_OSC7\_0\_Fix2 (created with InstallAnywhere by Macrovision)
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> ===============================================================================
>
> Installing\...
>
> \-\-\-\-\-\-\-\-\-\-\-\--
>
> \[==================\|==================\|==================\|==================\]
>
> \[\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\]
>
> Installation Complete.

-   To verify if the installation is successful.

> Check in \$OPENFRAME\_HOME there is a folder with **osc**
>
> Verify below installation logs at
> '/opt/tmaxapp/OpenFrame/UninstallerData/log' for any errors/warnings.
>
> **install\_OSC.logls**
>
> **OpenFrame\_OSC7\_0\_Fix2\_InstallLog.log**

-   Edit \$OPENFRAME\_HOME/config/ofsys.seq and enable servers for batch
    and tacf

    **[Before:]{.underline}**

    \#BASE

    ofrsasvr

    ofrlhsvr

    ofrdmsvr

    ofrdsedt

    ofrcmsvr

    ofruisvr

    ofrsmlog

    vtammgr

    TPFMAGENT

    \#BATCH

    \#BATCH\#obmtsmgr

    \#BATCH\#ofrpmsvr

    \#BATCH\#obmjmsvr

    \#BATCH\#obmjschd

    \#BATCH\#obmjinit

    \#BATCH\#obmjhist

    \#BATCH\#obmjspbk

    \#TACF

    \#TACF\#tmsvr

    **[After:]{.underline}**

    \#BASE

    ofrsasvr

    ofrlhsvr

    ofrdmsvr

    ofrdsedt

    ofrcmsvr

    ofruisvr

    ofrsmlog

    vtammgr

    TPFMAGENT

    \#BATCH

    obmtsmgr

    ofrpmsvr

    obmjmsvr

    obmjschd

    obmjinit

    obmjhist

    obmjspbk

    \#TACF

    tmsvr

<!-- -->

-   Execute the bash profile to update the environment variables

> **\[oframe\@ofdemo\]\$ . .bash\_profile**

-   To boot osc, issue command oscboot

    oframe\@tmaxof7:/home/oframe /\> oscboot

    OSCBOOT : pre-processing \[ OK \]

    TMBOOT for node(NODE1) is starting:

    Welcome to Tmax demo system: it will expire 2016/5/25

    Today: 2016/4/5

    TMBOOT: TMM is starting: Tue Apr 5 11:58:04 2016

    TMBOOT: CLL is starting: Tue Apr 5 11:58:04 2016

    TMBOOT: CLH is starting: Tue Apr 5 11:58:04 2016

    TMBOOT: TLM(tlm) is starting: Tue Apr 5 11:58:04 2016

    OSCBOOT : system server(ofrsasvr) \[ OK \]

    OSCBOOT : system server(ofrlhsvr) \[ OK \]

    OSCBOOT : system server(ofrdmsvr) \[ OK \]

    OSCBOOT : system server(ofrdsedt) \[ OK \]

    OSCBOOT : system server(ofrcmsvr) \[ OK \]

    OSCBOOT : system server(ofruisvr) \[ OK \]

    OSCBOOT : system server(ofrsmlog) \[ OK \]

    OSCBOOT : system server(vtammgr) \[ OK \]

    OSCBOOT : system server(TPFMAGENT) \[ OK \]

    OSCBOOT : system server(ofrpmsvr) \[ OK \]

    OSCBOOT : system server(obmjmsvr) \[ OK \]

    OSCBOOT : system server(obmjschd) \[ OK \]

    OSCBOOT : system server(obmjinit) \[ OK \]

    OSCBOOT : system server(obmjhist) \[ OK \]

    OSCBOOT : system server(obmjspbk) \[ OK \]

    OSCBOOT : system server(tmsvr) \[ OK \]

    OSCBOOT : OSC server(oscmgr) \[ OK \]

    OSCBOOT : OSC server(oscmcsvr) \[ OK \]

    OSCBOOT : OSC server(oscmnsvr) \[ OK \]

    OSCBOOT : OSC server(oscdfsvr) \[ OK \]

    OSCBOOT : OSC server(oscncsvr) \[ OK \]

    OSCBOOT : OSC server(oscolsvr) \[ OK \]

    OSCBOOT : OSC server(oscscsvr) \[ OK \]

    OSCBOOT : OSC RTSD loading(OSCOIVP1) \[ OK \]

    OSCBOOT : OSC region server(OSCOIVP1TL) \[ OK \]

    OSCBOOT : OSC region server(OSCOIVP1OMC) \[ OK \]

    OSCBOOT : OSC region server(OSCOIVP1C) \[ OK \]

    OSCBOOT : OSC region server(OSCOIVP1) \[ OK \]

    OSCBOOT : OSC trancalss server(OSCOIVP1\_TCL1) \[ OK \]

    OSCBOOT : OSC PLTPI loading(OSCOIVP1) \[ OK \]

    OSCBOOT : OSC Region(OSCOIVP1) \[ OK \]

    OSCBOOT : post-processing \[ OK \]

    oframe\@tmaxof7:/home/oframe /\>

-   To verify if all the server processes are up, check by command:

    **tmadmin**

    **si**

    oframe\@tmaxdemo:/opt/tmaxapp/OpenFrame/ /\> tmadmin

    \-\-- Welcome to Tmax Admin (Type \"quit\" to leave) \-\--

    \$\$1 NODE1 (tmadm): si

    \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--

    clh svrname (svri) status count qcount qpcount emcount

    \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--

    0 ofrsasvr ( 4) RDY 0 0 0 0

    0 ofrlhsvr ( 5) RDY 5 0 0 0

    0 ofrdmsvr ( 6) RDY 0 0 0 0

    0 ofrdsedt ( 7) RDY 0 0 0 0

    0 ofrcmsvr ( 8) RDY 0 0 0 0

    0 ofruisvr ( 9) RDY 0 0 0 0

    0 ofrsmlog ( 10) RDY 0 0 0 0

    0 vtammgr ( 11) RDY 0 0 0 0

    0 obmjmsvr ( 12) RDY 0 0 0 0

    0 obmjschd ( 13) RDY 1 0 0 0

    0 obmjinit ( 14) RDY 2 0 0 0

    0 obmjhist ( 15) RDY 0 0 0 0

    0 obmjspbk ( 16) RDY 0 0 0 0

    0 ofrpmsvr ( 17) RDY 0 0 0 0

    0 obmtsmgr ( 18) RDY 0 0 0 0

    0 tmsvr ( 19) RDY 0 0 0 0

    0 oscmgr ( 20) RDY 2 0 0 0

    0 oscmcsvr ( 21) RDY 0 0 0 0

    0 oscmnsvr ( 22) RDY 0 0 0 0

    0 oscncsvr ( 23) RDY 0 0 0 0

    0 oscolsvr ( 24) RDY 0 0 0 0

    0 oscscsvr ( 25) RDY 2 0 0 0

    0 oscdfsvr ( 26) RDY 0 0 0 0

    0 OSCOIVP1 ( 27) RDY 1 0 0 0

    0 OSCOIVP1C ( 28) RDY 0 0 0 0

    0 OSCOIVP1OMC ( 29) RDY 0 0 0 0

    0 OSCOIVP1TL ( 30) RDY 0 0 0 0

    0 OSCOIVP1\_TCL1 ( 31) RDY 0 0 0 0

    0 TPFMAGENT ( 32) RDY 0 0 0 0

    \$\$2 NODE1 (tmadm):

<!-- -->

-   If you have the below issue when oscboot command is executed...

> OSCBOOT : OSC RTSD loading(OSCOIVP1) \[fail\]
>
> OSCBOOT : cics\_ctrl\_boot(-52906) error: Check oscmgr\'s log file
>
> OSCBOOT : OSC Region(OSCOIVP1) \[fail\]
>
> oframe\@ofdemo:/opt/tmaxapp/OpenFrame /\> oferror 52906
>
> /\*
>
> /\* error no : -52906
>
> /\* error code: OSC\_ERR\_CTRL\_RTSD\_CREATE
>
> /\* error msg : rtsd internal error
>
> /\*

**\[Solution\]**

> oframe\@ofdemo:/home/oframe /\> oscboot -r OSCOIVP1 -m
>
> OSCBOOT : OSC RTSD loading(OSCOIVP1) \[ OK \]
>
> OSCBOOT : OSC region server(OSCOIVP1TL) \[ OK \]
>
> OSCBOOT : OSC region server(OSCOIVP1OMC) \[ OK \]
>
> OSCBOOT : OSC region server(OSCOIVP1C) \[ OK \]
>
> OSCBOOT : OSC region server(OSCOIVP1) \[ OK \]
>
> OSCBOOT : OSC trancalss server(OSCOIVP1\_TCL1) \[ OK \]
>
> OSCBOOT : OSC PLTPI loading(OSCOIVP1) \[ OK \]
>
> OSCBOOT : OSC Region(OSCOIVP1) \[ OK \]

-   If you have the below issue when oscboot command is executed...

> ![](media/image5.png){width="5.479166666666667in" height="1.84375in"}
>
> oframe\@tmaxdemo:/opt/ofapp/OpenFrame/ndbii/tagger/IDD/records /\>
> oferror 51044
>
> /\*
>
> /\* error no : -51044
>
> /\* error code: OSC\_ERR\_TDQ\_OSCTLSVR\_CONNECT
>
> /\* error msg : Connect error to the osctlsvr
>
> /\*
>
> **\[Solution\]**
>
> Check internal IP address with ifconfig command
>
> ![](media/image6.png){width="5.479166666666667in"
> height="2.7291666666666665in"}
>
> Open osc.OSCOIPV1.conf under \$OPENFRAME\_HOME/config

**cd \$OPENFRAME\_HOME/config**

**vi osc.OSCOIVP1.conf**

> change IP address from ifconfig

**TDQ\_LOG\_ADDRESS=172.31.48.200:68111**

> Recycle system

-   If OSC can't find **OSCOIVP1** in \$OPENFRAME\_HOME/core/appbin
    after **oscboot**, follow as below procuedures... (OSCOIVP1 file
    wasn't compiled since OFCOBOL is not working properly.)

    1.  Uninstall OSC
        (**\$OPENFRAME\_HOME/UninstallerData/Uninstall\_OSC**)

    2.  Uninstall OFCOBOL
        (**\$OFCOB\_HOME/UnstallerData/Uninstall\_OFCOBOL**)

    3.  Reinstall OFCOBOL

    4.  Reinstall OSC

 NDBII (for IDMS) Installation
=============================

-   NDBII installation using oframe id.

-   Verify if below file exist.

    **OpenFrame\_NDB2\_Linux\_x86\_64.bin**

    **ndb2.properties**

-   Edit ndb2**.**properties

> **vi /opt/tmaxsw/ndb2.properties**
>
> OPENFRAME\_HOME=/opt/tmaxapp/OpenFrame
>
> DEFAULT\_VOLSER=DEFVOL
>
> LIB\_CREATE=YES
>
> OPENFRAME\_LICENSE\_PATH=/opt/tmaxapp/OpenFrame/license

-   Run the installer by passing the file as parameter

> oframe\@ofdemo:/opt/tmaxsw /\> **OpenFrame\_NDB2\_Linux\_x86\_64.bin
> -f ndb2.properties**
>
> Preparing to install\...
>
> Extracting the JRE from the installer archive\...
>
> Unpacking the JRE\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> Preparing SILENT Mode Installation\...
>
> ===============================================================================
>
> OpenFrame\_NDB2 (created with InstallAnywhere by Macrovision)
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> ===============================================================================
>
> Installing\...
>
> \-\-\-\-\-\-\-\-\-\-\-\--
>
> \[==================\|==================\|==================\|==================\]
>
> \[\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\]
>
> Installation Complete.

-   Add environment variable in .bash\_profile

> **cd**
>
> **vi .bash\_profile**
>
> \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
>
> \#
>
> \# NDB2
>
> \#
>
> \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
>
> \#IMDS\_PATH SETTING
>
> export IDMS\_PATH=\$OPENFRAME\_HOME/ndbii/tagger

-   Reactivate .bash\_.profile

> **cd**
>
> **. .bash\_profile**

 OFIDMS/DC 7.0 fix 2 Installation (Online for IDMS)
==================================================

-   OFIDMS/DC installation using oframe id.

-   Verify if below file exist.

    **OpenFrame\_OFIDMS\_DC7\_0\_Fix2\_Linux\_x86\_64.bin**

    **ofidmsdc.properties**

-   Edit ndb2**.**properties

> **vi /opt/tmaxsw/ofidmsdc.properties**
>
> OPENFRAME\_HOME=/opt/tmaxapp/OpenFrame
>
> TSAM\_DATABASE=TVSAM
>
> OSC\_APP\_OSC\_TC\_PATH=/opt/tmaxapp/OpenFrame/temp/OSC\_TC

-   Before starting installation, the below configuration must be set in
    .bash\_profile

> **\#IMDS\_PATH SETTING**
>
> **export IDMS\_PATH=\$OPENFRAME\_HOME/ndbii/tagger**

-   Run the installer by passing the file as parameter

> oframe\@ofdemo:/opt/tmaxsw /\> **OpenFrame\_NDB2\_Linux\_x86\_64.bin
> -f ndb2.properties**
>
> Preparing to install\...
>
> Extracting the JRE from the installer archive\...
>
> Unpacking the JRE\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> Preparing SILENT Mode Installation\...
>
> ===============================================================================
>
> OpenFrame\_NDB2 (created with InstallAnywhere by Macrovision)
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> ===============================================================================
>
> Installing\...
>
> \-\-\-\-\-\-\-\-\-\-\-\--
>
> \[==================\|==================\|==================\|==================\]
>
> \[\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\|\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\]
>
> Installation Complete.

-   Bring up OpenFrame by oscboot

    **oscboot**

-   Check the status of servers

    **tmadmin**

    **si**

    oframe\@ofdemo:/opt/tmaxapp/OpenFrame/UninstallerData/log /\>
    tmadmin

    \-\-- Welcome to Tmax Admin (Type \"quit\" to leave) \-\--

    \$\$1 NODE1 (tmadm): si

    \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--

    clh svrname (svri) status count qcount qpcount emcount

    \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--

    0 ofrsasvr ( 4) RDY 0 0 0 0

    0 ofrlhsvr ( 5) RDY 5 0 0 0

    0 ofrdmsvr ( 6) RDY 0 0 0 0

    0 ofrdsedt ( 7) RDY 0 0 0 0

    0 ofrcmsvr ( 8) RDY 0 0 0 0

    0 ofruisvr ( 9) RDY 0 0 0 0

    0 ofrsmlog ( 10) RDY 0 0 0 0

    0 vtammgr ( 11) RDY 0 0 0 0

    0 obmjmsvr ( 12) RDY 0 0 0 0

    0 obmjschd ( 13) RDY 1 0 0 0

    0 obmjinit ( 14) RDY 2 0 0 0

    0 obmjhist ( 15) RDY 0 0 0 0

    0 obmjspbk ( 16) RDY 0 0 0 0

    0 ofrpmsvr ( 17) RDY 0 0 0 0

    0 obmtsmgr ( 18) RDY 0 0 0 0

    0 tmsvr ( 19) RDY 0 0 0 0

    0 oscmgr ( 20) RDY 2 0 0 0

    0 oscmcsvr ( 21) RDY 0 0 0 0

    0 oscmnsvr ( 22) RDY 0 0 0 0

    0 oscncsvr ( 23) RDY 0 0 0 0

    0 oscolsvr ( 24) RDY 0 0 0 0

    0 oscscsvr ( 25) RDY 2 0 0 0

    0 oscdfsvr ( 26) RDY 0 0 0 0

    0 OSCOIVP1 ( 27) RDY 1 0 0 0

    0 OSCOIVP1C ( 28) RDY 0 0 0 0

    0 OSCOIVP1OMC ( 29) RDY 0 0 0 0

    0 OSCOIVP1TL ( 30) RDY 0 0 0 0

    0 OSCOIVP1\_TCL1 ( 31) RDY 0 0 0 0

    0 TPFMAGENT ( 32) RDY 41 0 0 0

-   If you have the below issue when oscboot command is executed...

> ![](media/image5.png){width="5.479166666666667in" height="1.84375in"}
>
> oframe\@ofdemo:/opt/tmaxapp/OpenFrame/ndbii/tagger/IDD/records /\>
> oferror 51044
>
> /\*
>
> /\* error no : -51044
>
> /\* error code: OSC\_ERR\_TDQ\_OSCTLSVR\_CONNECT
>
> /\* error msg : Connect error to the osctlsvr
>
> /\*
>
> **\[Solution\]**
>
> Check internal IP address with ifconfig command
>
> ![](media/image6.png){width="5.46875in" height="2.7291666666666665in"}
>
> Open osc.OSCOIPV1.conf under \$OPENFRAME\_HOME/config

**cd \$OPENFRAME\_HOME/config**

**vi osc.OSCOIVP1.conf**

> change IP address from ifconfig

**TDQ\_LOG\_ADDRESS=172.31.48.200:68111**

> Recycle system

 JEUS Installation (tar.gz version only)
=======================================

> This guide is for installation **MANUALLY** by using Jeus7 Fix\#4
> binary, jeus704.tar.gz and describes target system based on x86\_64
> and JDK 1.7

Sun JDK install -\> Ant install -\> JEUS build and install -\> Boot for
DAS and Boot for MS after configuration

Sun JDK Installation
--------------------

-   Switch user to ROOT

> **sudo su --**

-   Uninstall openjdk

> **rpm -qa \| grep openjdk**
>
> **yum remove java-1.7.0-openjdk-1.7.0.85-2.6.1.2.el7\_1.x86\_64**
>
> **yum remove
> java-1.7.0-openjdk-headless-1.7.0.85-2.6.1.2.el7\_1.x86\_64**

-   Install Sun JDK (you can download file from Sun website)

> **rpm -ivh jdk-7u79-linux-x64.rpm**

-   Switch user

> **su -- oframe**

quit

-   Add Java JDK environment variables and apply it.

> **cd**
>
> **vi .bash\_profile**

  ----
  Cd
  ----

> **. .bash\_profile**
>
> **echo \$JAVA\_HOME**
>
> /usr/java/jdk1.7.0\_79/

Ant Installation
----------------

> Ant is automation build tool such as make, maven. This tool need to
> build JEUS. Please install Ant if doesn't install it

-   Change directory for installation

> **cd /opt/tmaxui**

-   Downloads Ant binary

> \# **wget
> <http://apache.mirror.cdnetworks.com/ant/binaries/apache-ant-1.9.7-bin.tar.gz>**
>
> You can download the file through web browser with the link

-   Uncompress binary and move to the actual directory

> **tar -xzvf apache-ant-1.9.7-bin.tar.gz**
>
> oframe\@ofdemo:/opt/tmaxsw /\> mv apache-ant-1.9.7 /opt/tmaxui/

-   Create link file for efficiency

> **ln -s apache-ant-1.9.7 ant**

-   Add Ant Env and apply it.

> **cd**
>
> **vi .bash\_profile**

+----------------------------------------+
| \# Ant ENV                             |
|                                        |
| export ANT\_HOME=/opt/tmaxui/ant       |
|                                        |
| export PATH=/opt/tmaxui/ant/bin:\$PATH |
+----------------------------------------+

> **. .bash\_profile**
>
> **echo \$ANT\_HOME**
>
> /opt/tmaxui/ant

JEUS Installation
-----------------

-   Steps for manually installation

> Uncompression -\> Initial the binary by clean-all -\> modify
> properties file suitable for your own computer -\> build -\> boot
> Domain Admin Server -\> modify server1 properties -\> boot Managed
> Server

-   Uncompress and move to actual directory path

> **oframe\@ofdemo:/opt/tmaxsw /\> tar -zxvf jeus704.tar.gz**
>
> oframe\@ofdemo:/opt/tmaxsw /\> **mv jeus7 /opt/tmaxui/**

-   Change directory at setup

> **cd /opt/tmaxui/jeus7/setup/**

-   Please execute 'ant clean-all' before performing build.

> **ant clean-**
>
> ![](media/image7.png){width="5.40625in" height="2.9270833333333335in"}

-   Take a backup of domain-config-template.properties for your own
    environment

-   Modify domain-config-template.properties for your own environment

> **vi domain-config-template.properties**
>
> ![](media/image8.png){width="5.5in" height="3.4375in"}

-   Edit the variable values as shown below

> **jeus.password=tmax1234**
>
> **nodename=ofdemo**
>
> **jeus.password** means password for connecting jeus server
>
> **jeus.username** means username for connecting jeus server.
>
> **nodename** means **hostaname** own your computer. Please fill out
> the nodename field after checking using hostname commands.

-   JEUS build

> **ant install**
>
> ![](media/image9.png){width="4.25in" height="1.71875in"}
>
> ![](media/image10.png){width="4.25in" height="1.0in"}

-   Add JEUS env

> **cd**
>
> **vi .bash\_profile**

  -------
  Cd se
  -------

> **. .bash\_profile**
>
> **cd \$JEUS\_HOME/bin**

-   Start Domain Admin Server

> **startDomainAdminServer -domain jeus\_domain -u administrator -p
> tmax1234**
>
> ![](media/image11.png){width="4.96875in" height="2.15625in"}

-   Connects the JEUS admin by using web browers

> URL: **IPaddress of JEUS Server:9736/webadmin**
>
> Ex. 54.236.230.71:9736/webadmin
>
> ![](media/image12.png){width="5.0625in" height="3.6770833333333335in"}

-   Stop the firewall rules using below command with "**root**" ID

> **su -**
>
> **systemctl stop firewalld**
>
> **exit**

-   Change setup for server1 to bring up

> ![](media/image13.png){width="4.354166666666667in"
> height="2.90625in"}![](media/image14.png){width="1.6875in"
> height="2.625in"}
>
> ![](media/image15.png){width="5.614583333333333in"
> height="3.1666666666666665in"}
>
> ![](media/image16.png){width="4.604166666666667in"
> height="2.125in"}![](media/image17.png){width="1.3541666666666667in"
> height="2.03125in"}
>
> **startManagedServer -domain jeus\_domain -server server1 -u
> administrator -p tmax1234**
>
> ![](media/image18.png){width="5.75in" height="2.1041666666666665in"}
>
> ![](media/image19.png){width="2.4791666666666665in" height="0.5625in"}

 How to create a server in JEUS7 by duplicating
----------------------------------------------

-   Turn on Edit mode by clicking of "Lock & Edit" button

![](media/image14.png){width="1.6875in" height="2.625in"}

-   Dupclicate server1 by clicking "DUP" button

![](media/image20.png){width="5.802083333333333in"
height="1.9583333333333333in"}

-   Put Node name (ex, cgipoc) and Server name(ex, ofadm\_svr), then
    click "OK" button

![](media/image21.png){width="4.354166666666667in" height="2.0625in"}

-   Now, server (ofadm\_svr) is created. In order to avoid the conflict
    of port usage, change the port number as follows.

-   In server view, double click target server (ofadm\_svr)

![](media/image22.png){width="5.072916666666667in" height="2.03125in"}

-   Double click Base and change port number

![](media/image23.png){width="5.552083333333333in" height="2.90625in"}

![](media/image24.png){width="5.53125in" height="2.6041666666666665in"}

-   Repeat changing http and jms ports (The port numbers must be unique
    in server)

-   Apply changed and turn off edit mode by clicking "Apply Changes"
    button

![](media/image17.png){width="1.53125in" height="2.3333333333333335in"}

-   Create 3 managed servers for OpenFrame minimally. Their names are
    defined as below

  OpenFrame web-solution   Managed server name   http port (recommand)
  ------------------------ --------------------- -----------------------
  OFGateway                ofgw\_svr             8078
  OFAdmin                  ofadm\_svr            8088
  OFMiner                  ofminer\_svr          8098

-   Servers can be started by below command

> **startManagedServer -domain Jeus\_domain -server "server name" -u
> administrator -p tmax1234**
>
> ex) startManagedServer -domain Jeus\_domain -server ofgw\_svr -u
> administrator -p tmax1234

 OFGW Installation
=================

By Installing OFGW, we implement UI layer for OpemFrame which consist of

WebTerminal & T3270 Terminal (eg, QWS3270p or RUMBA)
----------------------------------------------------

1.  Webterminal (TmaxSoft web product to replace traditional 3270)

-   Before start installation, create a server (**ofgw\_svr**) in JEUS
    through webadmin of JEUS

> Go to URL http://54.236.230.71:9736/webadmin

-   Confirm the status of JEUS and OFGW servers. They must be up for
    automatic deployment.

-   Verify binary file exist

> **OFGW7\_0\_1\_Generic.bin**

-   Verify JEUS 7 is installed and shutdown

-   Change the permissions of the installer file

> **chmod a+x OFGW7\_0\_1\_Generic.bin**

-   Execute the installer file

> **./OFGW7\_0\_1\_Generic.bin**
>
> oframe\@ofdemo:/opt/tmaxsw /\> ./OFGW7\_0\_1\_Generic.bin
>
> Preparing to install\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> Preparing CONSOLE Mode Installation\...
>
> ===============================================================================
>
> OFGW7.0.1 (created with InstallAnywhere by Macrovision)
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> ===============================================================================
>
> Introduction
>
> \-\-\-\-\-\-\-\-\-\-\--

-   Below are the keystrokes, to be entered during JEUS installation

> **Enter**
>
> **Enter**
>
> **Enter**
>
> **y**
>
> **/opt/tmaxui/jeus7**
>
> **y**
>
> **jeus\_domain**
>
> **ofgw\_svr**
>
> **tmax1234**
>
> **Enter 54.236.230.71**
>
> **Enter 9736**
>
> **1**
>
> **Enter 54.236.230.71**
>
> **8629**
>
> **Enter TVSAM**
>
> **tibero**
>
> **tmax**
>
> **ofgw**
>
> **5566** (Same as TSAM PORT)
>
> **ds1**
>
> **webterminal**
>
> **NODE1**
>
> **Enter** 54.236.230.71 **-\> use hostname instead of IP address**
>
> **6513** (echo \$TMAX\_HOST\_PORT) using oframe id
>
> **/opt/tmaxsw/oflicense/ofgw/OFGWLicense**
>
> **Enter**
>
> **Enter**

-   If license file is not set up correctly, copy it (OFGWLicense) to

> **oframe\@ofdemo:/opt/tmaxui/jeus7/domains/jeus\_domain/servers/ofgw\_svr/lib/application/ofgwconf/license**
>
> **ln -s /opt/tmaxsw/oflicenses/ofgw/OFGWLicense .**

-   Tibero 5's jdbc dirver is initially provided. If another version of
    Tibero or other database, copy it under \$JEUS\_HOME/lib/datasource

-   Start Administrator server(admin) and Managed server(server1)

<!-- -->

-   Bring up Domain Admin Server with the below command:

    **startDomainAdminServer -u administrator -p tmax1234**

-   Bring Managerd Server with the below command:

    **startManagedServer -domain jeus\_domain -server ofgw\_svr -u
    administrator -p tmax1234**

<!-- -->

-   To verify if the JUES server is up and running follow below

1)  Go to URL

> [**http://54.236.230.71:9736/webadmin**](http://54.236.230.71:9736/webadmin)
>
> **id : administrator**
>
> **password : tmax1234**
>
> click "server" after log-in
>
> Check server status as running both admin and server1

![](media/image25.png){width="4.770833333333333in"
height="2.5833333333333335in"}

2)  Thru jeusadmin

> **jeusadmin -u administrator -p tmax1234**
>
> **serverinfo**

\[DAS\]jeus\_domain.adminServer\>serverinfo

Information about Domain (jeus\_domain)

================================================================================

+\-\-\-\-\-\--+\-\-\-\-\-\-\-\--+\-\-\-\--+\-\-\-\--+\-\-\-\--+\-\-\-\-\-\-\-\-\-\-\--+\-\-\-\-\-\-\--+\-\-\-\-\-\-\-\-\-\--+\-\-\-\-\-\-\--+

\| Server\| Status \| Node\| PID \| Clus\| Latest \| Need to\| Listen \|
Running\|

\| \| \|Name \| \| ter \|Start Time /\|Restart \| Ports \|Engines \|

\| \| \| \| \| \| Shutdown \| \| \| \|

\| \| \| \| \| \| Time \| \| \| \|

+\-\-\-\-\-\--+\-\-\-\-\-\-\-\--+\-\-\-\--+\-\-\-\--+\-\-\-\--+\-\-\-\-\-\-\-\-\-\-\--+\-\-\-\-\-\-\--+\-\-\-\-\-\-\-\-\-\--+\-\-\-\-\-\-\--+

\| adminS\| RUNNING(\| cgip\|26743\| N/A \| Mon Aug 22 \| false \|
BASE-0.0.0\| jms, \|

\|erver(\*\|00:49:01)\|oc \| \| \|17:19:57 UTC\| \|.0:9736 \|ejb, web\|

\|) \| \| \| \| \|2016 \| \| http-serve\| \|

\| \| \| \| \| \| \| \|r-0.0.0.0:8\| \|

\| \| \| \| \| \| \| \|808 \| \|

\| \| \| \| \| \| \| \| jms-intern\| \|

\| \| \| \| \| \| \| \|al-0.0.0.0:\| \|

\| \| \| \| \| \| \| \|9941 \| \|

+\-\-\-\-\-\--+\-\-\-\-\-\-\-\--+\-\-\-\--+\-\-\-\--+\-\-\-\--+\-\-\-\-\-\-\-\-\-\-\--+\-\-\-\-\-\-\--+\-\-\-\-\-\-\-\-\-\--+\-\-\-\-\-\-\--+

\| ofgw\_s\| RUNNING(\| cgip\|26881\| N/A \| Mon Aug 22 \| false \|
BASE-0.0.0\| jms, \|

\|vr \|00:47:14)\|oc \| \| \|17:21:43 UTC\| \|.0:9966 \|ejb, web\|

\| \| \| \| \| \|2016 \| \| http-serve\| \|

\| \| \| \| \| \| \| \|r1-0.0.0.0:\| \|

\| \| \| \| \| \| \| \|8118 \| \|

\| \| \| \| \| \| \| \| jms-intern\| \|

\| \| \| \| \| \| \| \|al1-0.0.0.0\| \|

\| \| \| \| \| \| \| \|:9771 \| \|

+\-\-\-\-\-\--+\-\-\-\-\-\-\-\--+\-\-\-\--+\-\-\-\--+\-\-\-\--+\-\-\-\-\-\-\-\-\-\-\--+\-\-\-\-\-\-\--+\-\-\-\-\-\-\-\-\-\--+\-\-\-\-\-\-\--+

================================================================================

-   Install webterminal.war from Web Admin

> Recycle domain admin server and managed server before deploying the
> applications

-   If webterminal is not deployed automatically during installation.
    Deploy webterminal application in server by the below command
    manually.

    **jeusadmin -u administrator -p tmax1234 \"deploy-application
    -servers ofgw\_svr webterminal"**

-   If OpenFrame is running on Amazon AWS, open coresponding port for
    ofsw\_svr by **scecurity group** configuration with Amazon login.

-   Confirm OFGW is working properly

<!-- -->

-   Open web-browser with http: <http://54.236.230.71:8078/webterminal/>

    Click CONNECT button on top. LU name is automatically assigned.

    ![](media/image26.png){width="4.979166666666667in"
    height="3.8125in"}

> OSCOIVP1

OIVP

BROS

![](media/image27.png){width="4.583333333333333in"
height="3.5104166666666665in"}

![](media/image28.png){width="4.59375in" height="3.53125in"}

![](media/image29.png){width="4.572916666666667in"
height="3.5416666666666665in"}

 {#section-1 .ListParagraph}

-   **If screen doesn't show after entering online region name, check
    configuration for region as below.**

\$OPENFRAME\_HOME/config/osc.OSCOIVP1.conf

> \[CPM\]
>
> 3270\_CCSID=37
>
> REGION\_CCSID=437

 OFAdmin Installation
====================

-   Before start installation, create a server (**ofadm\_svr**) in JEUS
    through webadmin of JEUS

> Go to URL <http://54.236.230.71:9736/webadmin>

-   Confirm the status of JEUS and OFAdmin servers. They must be up for
    automatic deployment.

-   Copy the OpenStudio Web Binary file to server

> **OFAdmin7\_0\_Generic.bin**

-   Provide execute permission to Binary file

> **chmod a+x OFAdmin7\_0\_Generic.bin**

-   Run the install File.

> oframe\@ofdemo:/opt/tmaxsw /\> ./OFAdmin7\_0\_Generic.bin
>
> Preparing to install\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> Preparing CONSOLE Mode Installation\...
>
> ===============================================================================
>
> OFAdmin (created with InstallAnywhere by Macrovision)
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> ===============================================================================
>
> Introduction
>
> \-\-\-\-\-\-\-\-\-\-\--
>
> InstallAnywhere will guide you through the installation of OFAdmin.

-   Below are the keystrokes, to be entered during JEUS installation

> **./ OFAdmin7\_0\_Generic.bin**
>
> **Enter**
>
> **Enter**
>
> **Enter**
>
> **Y**
>
> **Enter 54.236.230.71 Batch IP -\> use hostname instead of IP
> address**
>
> **Enter 6513 Batch Port**
>
> **Enter 54.236.230.71 Online IP-\> use hostname instead of IP
> address**
>
> **Enter 6513 Online Port**
>
> **Enter NODE1**
>
> **Enter OSCOIVP1**
>
> **Enter 54.236.230.71 Jeus IP-\> use hostname instead of IP address**
>
> **Enter jeus\_domain**
>
> **Enter 9736**
>
> **tmax1234**
>
> **ofadm\_svr**
>
> **Enter OFAdmin**
>
> **/opt/tmaxsw/oflicense/ofamin/OFAdminLicense**
>
> **Enter 1**
>
> **Enter**

-   If license file is not set up correctly, copy it (OFAdminLicense) to

> oframe\@ofpoc01.local:/opt/tmaxui/jeus7/samples/OFAdmin/license /\>
>
> **ln -s /opt/tmaxsw/OF7\_Licenses/ofadmin/OFAdminLicense .**

-   If OpenFrame is running on Amazon AWS, open coresponding port for
    ofadm\_svr by **scecurity group** configuration with Amazon login.

-   TEST OFAdmin

    Open web-browser <http://54.236.230.71:8088/OFAdmin/OFAdmin.html>

    i**d: ROOT**

    **pw: SYS1**

    ![](media/image30.png){width="4.072916666666667in"
    height="2.1354166666666665in"}

    ![](media/image31.png){width="4.104166666666667in" height="2.125in"}

-   If OFAdmin is not deployed, Deploy it (ofadm\_svr) manually.

1)  If JEUS admin and OFAdmin servers are not on, bring up them in
    command line

    **startDomainAdminServer -u administrator -p tmax1234**

    **startManagedServer -domain jeus\_domain -server ofadm\_svr -u
    administrator -p tmax1234**

2)  Open web-browser
    [**http://54.236.230.71:9736/webadmin/login**](http://54.236.230.71:9736/webadmin/login)

**id: administrator**

**pw: tmax1234**

3)  Click "Application" section and "deploy" button as below

![](media/image32.png){width="4.8125in" height="2.2916666666666665in"}

4)  Deployment

    **Id: OFAdmin**

    **Path: /opt/tmaxui/OFAdmin/OFAdmin7.0**

    **Type: WAR**

    **Server: ofadm\_srvr**

    **Choose the path as OFAdmin instead of OFAdmin/OFAdmin7**

> ![](media/image33.png){width="4.78125in"
> height="2.3020833333333335in"}
>
> Then, Click **OK**

5)  Check the status of OFAdmin application

    ![](media/image34.png){width="4.71875in" height="2.4375in"}

 OFMiner Installation 
=====================

-   Before start installation, create a server (**ofminer\_svr**) in
    JEUS through webadmin of JEUS

> Go to URL <http://54.236.230.71:9736/webadmin>

-   Confirm the status of JEUS and OFMiner servers. They must be up for
    automatic deployment.

-   Copy the OpenStudio Web Binary file to server

> **./OFMiner7\_0\_Generic.bin**

-   Provide execute permission to Binary file

> **chmod a+x OFMiner7\_0\_Generic.bin**

-   Run the install File.

> oframe\@ofdemo:/opt/tmaxsw /\> ./OFMiner7\_0\_Generic.bin
>
> Preparing to install\...
>
> Extracting the installation resources from the installer archive\...
>
> Configuring the installer for this system\'s environment\...
>
> Launching installer\...
>
> Preparing CONSOLE Mode Installation\...
>
> ===============================================================================
>
> OFMiner created with InstallAnywhere by Macrovision)
>
> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
>
> =============================================================================
>
> Introduction
>
> \-\-\-\-\-\-\-\-\-\-\--
>
> InstallAnywhere will guide you through the installation of OFMiner.

-   Below are the keystrokes, to be entered during JEUS installation

> **./OFMiner7\_0\_Generic.bin**
>
> **Enter**
>
> **Enter**
>
> **Enter**
>
> **Y**
>
> **/opt/tmaxui/ofminer**
>
> **Y**
>
> **ofminer\_svr**
>
> **tmax1234**
>
> **9736**
>
> **Enter 54.236.230.71 -\> use hostname instead of IP address**
>
> **Enter 8629**
>
> **Enter TVSAM**
>
> **Enter tibero**
>
> **Enter tmax**
>
> **/opt/tmaxsw/oflicense/ofminer/OFMinerLicense**
>
> **Enter**

-   If OFMiner is not deployed, Deploy it (ofminer\_svr) manually.

6)  If JEUS admin and OFMdmin servers are not on, bring up them in
    command line

    **startDomainAdminServer -u administrator -p tmax1234**

    **startManagedServer -domain jeus\_domain -server ofm\_svr -u
    administrator -p tmax1234**

7)  Open web-browser
    [**http://54.236.230.71:9736/webadmin/login**](http://54.236.230.71:9736/webadmin/login)

**id: administrator**

**pw: tmax1234**

8)  Click "Application" section and "deploy" button as below

![](media/image32.png){width="4.8125in" height="2.2916666666666665in"}

9)  Deployment

    **ID: ofminer**

    **Path: /opt/tmaxui/ofminer**

    **Type: WAR**

    **Server: ofm\_srvr**

    **Choose the path as OFAdmin instead of OFAdmin/OFAdmin7**

> ![](media/image33.png){width="4.78125in"
> height="2.3020833333333335in"}
>
> Then, Click **OK**

10) Check the status of OFMiner application

-   If useless applications are listed in application tab in Jeus
    webadmin, modify domain.xml under
    /opt/tmaxui/jeus7/domain/jeus\_domain/config/

> **cd /opt/tmaxui/jeus7/domain/jeus\_domain/config/**
>
> **vi domain.xml**
>
> Remove or disable (commenation) the below lines
>
> \<application-repositories\>
>
> \<application-repository\>/opt/tmaxui\</application-repository\>
>
> \</application-repositories\>

-   If license file is not set up correctly, copy it (OFAdminLicense) to

> oframe\@ofpoc01.local:/opt/tmaxui/jeus7/samples/OFAdmin/license /\>
>
> **ln -s /opt/tmaxsw/OF7\_Licenses/ofadmin/OFAdminLicense .**

-   If OpenFrame is running on Amazon AWS, open coresponding port for
    ofadm\_svr by **scecurity group** configuration with Amazon login.

-   Before testing OFMiner, restart JEUS and OFMiner server

-   TEST OFMiner

Open web-browser <http://54.236.230.71:8098/ofminer/OFMiner.html>

i**d: ROOT**

**pw: SYS1**

![](media/image35.png){width="4.645833333333333in"
height="2.4270833333333335in"}

![](media/image36.png){width="4.604166666666667in" height="2.53125in"}

-   Patch applying

    5.  Cobolparser: if OFCOBOL is not installed in the system,
        unicobinfo binary and configuration must be set up.

        -   Patch Installation

> **ofsw**
>
> **tar -xvzf cobolparser-2.0.70-Linux.tar.gz**
>
> **mv cobolparser /opt/tmaxui/ofminer/**

-   Configuration

> **cd**
>
> **vi .bash\_profile**
>
> Add below lines
>
> export PATH=\"\$OFMINER\_HOME/cobolparser/bin:\${PATH}\"
>
> export
> LD\_LIBRARY\_PATH=\"\$OFMINER\_HOME/cobolparser/lib:\${LD\_LIBRARY\_PATH}\"
>
> **. .bash\_profile**

6.  If version of mvsana is lower than 7.0.2(1), replace it from
    **IMS112476\_mvsana\_libmvsjcl\_20161021.tar.gz** under
    **/opt/tmaxsw/**

7.  If version of libmvsjcl.so is lower than 7.0.2(3), replace it from
    **IMS112476\_mvsana\_libmvsjcl\_20161021.tar.gz** under
    **/opt/tmaxsw/** and create symbolic link

-   When installing both OFGW and OFMiner in the same managed server or
    MS, OFMiner's log files are likely to be created in the place where
    OFGW's log files are stored.

+-----------------------------------+-----------------------------------+
| **Valid OFMiner Log Path**        | \$OFMINER\_HOME/logs              |
+===================================+===================================+
| **Valid OFGW Log Path**           | \$JEUS\_HOME/domains/{domain\_nam |
|                                   | e}/servers/{server\_name}         |
|                                   |                                   |
|                                   | /lib/application/logs/            |
+-----------------------------------+-----------------------------------+
| **OFGW and OFMiner Log Path**     | \$JEUS\_HOME/domains/{domain\_nam |
|                                   | e}/servers/{server\_name}         |
|                                   |                                   |
|                                   | /lib/application/logs/            |
+-----------------------------------+-----------------------------------+

> **\[RESOLUTION\]**
>
> This issue can be handled by either one of the following:

1)  To install OFGW and OFMiner to separate managed servers.
    (RECOMMENDED)\
    It is efficient to have the two products maintained separately.

2)  To modify domain.xml and logback.xml (See below)

> There are couple of steps for the configuration, which sets up a
> logback.xml-related JVM option and change the log file path in the
> logback.xml for the OFGW and OFMiner.

1)  Specify the path to logback.xml in \<jvm-config\> from the server's
    domain.xml where OFGW and OFMiner are installed.\
    e.g,

    \<jvm-option\>-Xmx1024m -XX:MaxPermSize=128m
    -Dlogback.configurationFile=/home/oftest/jeus7/domains/qa\_domain/servers/server1/logs/logback.xml\</jvm-option\>

2)  Specify the path, filename, and level of the log in the logback.xml.
    Two logback.xml files created by default can be found in the
    directories in which products are installed. Please refer to
    property name, appender name, logger name, and root level in the
    logback.xml.\
    e.g,

> \<property name=\"USER\_HOME1\"
> value=\"\$JEUS\_HOME/domains/jeus\_domain/servers/server1/lib/application/logs\"
> /\>

\<property name=\"USER\_HOME2\" value=\"\${OFMINER\_HOME}/logs\" /\>

\<appender name=\"OFGW\" class=,,,\> ,,, \</appender\>

\<appender name=\"OFMiner\" class=,,,\> ,,, \</appender\>

\<logger name=,, {Describe OFGW-related loggers here}\>

\<logger name=,, {Describe OFMIner-related loggers here}\>

**Sample of logback.xml**

> \<?xml version=\"1.0\" encoding=\"UTF-8\"?\>
>
> \<configuration scan=\"true\" scanPeriod=\"30 seconds\"\>
>
> \<appender name=\"STDOUT\"
> class=\"ch.qos.logback.core.ConsoleAppender\"\>
>
> \<layout\>
>
> \<pattern\>
>
> \[%d{yyyy-MM-dd}T%d{HH:mm:ss.SSSSS}\] \[OFGW\|%-24logger{0}\]
> \[%.-1level\] %msg%n
>
> \</pattern\>
>
> \</layout\>
>
> \</appender\>
>
> \<property name=\"USER\_HOME1\"
> value=\"/mnt/pocdisk/tmaxapp/NODE2/jeus7/domains/jeus\_domain/servers/server1/lib/application/logs\"
> /\>
>
> \<property name=\"USER\_HOME2\"
> value=\"/mnt/pocdisk/tmaxapp/NODE2/OFMiner/logs\" /\>
>
> \<appender name=\"OFGW\"
> class=\"ch.qos.logback.core.rolling.RollingFileAppender\"\>
>
> \<rollingPolicy
> class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\"\>
>
> \<!\-- daily rollover \--\>
>
> \<fileNamePattern\>\${USER\_HOME1}/ofgw-%d{yyyy-MM-dd}.%i.log\</fileNamePattern\>
>
> \<timeBasedFileNamingAndTriggeringPolicy
> class=\"ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP\"\>
>
> \<!\-- or whenever the file size reaches 50MB \--\>
>
> \<maxFileSize\>300MB\</maxFileSize\>
>
> \</timeBasedFileNamingAndTriggeringPolicy\>
>
> \<!\-- keep 30 days\' worth of history \--\>
>
> \<maxHistory\>30\</maxHistory\>
>
> \</rollingPolicy\>
>
> \<encoder\>
>
> \<pattern\>
>
> \[%d{yyyy-MM-dd}T%d{HH:mm:ss.SSSSS}\] \[OFGW\|%-24logger{0}\]
> \[%.-1level\] %msg%n
>
> \</pattern\>
>
> \</encoder\>
>
> \</appender\>
>
> \<appender name=\"OFMiner\"
> class=\"ch.qos.logback.core.rolling.RollingFileAppender\"\>
>
> \<rollingPolicy
> class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\"\>
>
> \<!\-- daily rollover \--\>
>
> \<fileNamePattern\>\${USER\_HOME2}/ofminer-%d{yyyy-MM-dd}.%i.log\</fileNamePattern\>
>
> \<timeBasedFileNamingAndTriggeringPolicy
> class=\"ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP\"\>
>
> \<!\-- or whenever the file size reaches 50MB \--\>
>
> \<maxFileSize\>300MB\</maxFileSize\>
>
> \</timeBasedFileNamingAndTriggeringPolicy\>
>
> \<!\-- keep 30 days\' worth of history \--\>
>
> \<maxHistory\>30\</maxHistory\>
>
> \</rollingPolicy\>
>
> \<encoder\>
>
> \<pattern\>%d{HH:mm:ss.SSS} %-5level %logger{35} - %msg%n\</pattern\>
>
> \</encoder\>
>
> \</appender\>
>
> \<logger name=\"com.tmax.webtnio\" level=\"OFF\"\>
>
> \<appender-ref ref=\"OFGW\"/\>
>
> \</logger\>
>
> \<logger name=\"com.tmax.ofgw\" level=\"DEBUG\"\>
>
> \<appender-ref ref=\"OFGW\"/\>
>
> \</logger\>
>
> \<logger name=\"com.tmax.ofgw.io.DBConnectionThread\"
> level=\"DEBUG\"\>
>
> \<appender-ref ref=\"OFGW\"/\>
>
> \</logger\>
>
> \<logger name=\"com.tmax.ofgw.io.DBChannelImpl\" level=\"INFO\"\>
>
> \<appender-ref ref=\"OFGW\"/\>
>
> \</logger\>
>
> \<logger name=\"com.tmax.ofgw.work.WebProtocol\" level=\"INFO\"\>
>
> \<appender-ref ref=\"OFGW\"/\>
>
> \</logger\>
>
> \<logger name=\"com.tmax.ofgw.io.TransWorkerChImpl\" level=\"INFO\"\>
>
> \<appender-ref ref=\"OFGW\"/\>
>
> \</logger\>
>
> \<logger name=\"com.tmax.OFMiner\" level=\"DEBUG\"\>
>
> \<appender-ref ref=\"OFMiner\"/\>
>
> \</logger\>
>
> \<root level=\"DEBUG\"\>
>
> \<appender-ref ref=\"STDOUT\"/\>
>
> \</root\>
>
> \</configuration\>

 Other issue cases
=================

Cloned OpenFrame setup -- NEW IP address
----------------------------------------

-   When a cloned OpenFrame is created, configurations with IP address
    must be modified. The below list contains a set of configuration
    files and their locations.

+-----------------------+-----------------------+-----------------------+
| Product Name          | File name             | Location              |
+=======================+=======================+=======================+
| Tibero                | None                  | \-                    |
+-----------------------+-----------------------+-----------------------+
| OpenFrame             | osc.OSCOIVP1.conf\*   | \$OPENFRAME\_HOME/con |
|                       |                       | fig                   |
+-----------------------+-----------------------+-----------------------+
| JEUS                  | domain.xml            | \$JEUS\_HOME/domains/ |
|                       |                       | jeus\_domain/config   |
+-----------------------+-----------------------+-----------------------+
|                       | domain\_ofgw\_sample. | \$JEUS\_HOME/domains/ |
|                       | xml\*                 | jeus\_domain/config   |
+-----------------------+-----------------------+-----------------------+
|                       | server1.address\*     | \$JEUS\_HOME/domains/ |
|                       |                       | jeus\_domain/servers  |
|                       |                       |                       |
|                       |                       | /server1/nodemanager  |
+-----------------------+-----------------------+-----------------------+
|                       | of7main.html          | \$JEUS\_HOME/samples/ |
|                       |                       | of7links              |
+-----------------------+-----------------------+-----------------------+
| OFAdmin               | ofadmin.properties    | \$OFADMIN\_HOME/conf  |
+-----------------------+-----------------------+-----------------------+
| OFMiner               | db.properties         | \$OFMINER\_HOME/prope |
|                       |                       | rties                 |
+-----------------------+-----------------------+-----------------------+

-   osc.OSCOIVP1.conf: In \[TDQ\] section, internal IP address not pubic
    IP may be needed. Check with "**ifconfig**" command. Default value
    is "**localhost**". If default value is working, don't change it. If
    OpenFrame contains multi regions, check all region configuration
    file.

-   domain\_ofgw\_sample.xml: This is a sample file. It doesn't affect
    on JEUS performance directly.

-   server1.address: If JEUS contains multi servers, check ones for
    other servers.

-   of7main.html: Customized web link file. In some Openframe
    environment, it may not exist.

 Tibero TAC & Clustering Configuration
=====================================

Introduction
------------

This document explains how to configure clustering environment for
OpenFrame. A shared disk is a prerequisite with at least two server
nodes.

It was created for **Amazon AWS** environment which provides **[EFS or
Elastic File System]{.underline}** based on NFS or Network File System.
This guide shows how to configure the clustering environment for
OpenFrame, partially based on OpenFrame7\_fix2\_installation document.
If a normal shared file system is used such as Veritas and EFS, this
document can be referred.

Tibero 6 FS04 was used for the TAC installation. Please note that Tibero
6 FS05 or higher requires more complicated installation steps for TAC
than FS04 thanks to the introduction of a new CM, which does not conform
to this guide. Also, TAS or Tibero Active Storage, a proprietary file
system provided by Tibero 6 does not apply to the guide.

This guide is an appendix to the document
"OpenFrame7\_fix2\_installation" document. IP and port configuration may
differ depending on the environment.

1.  **BRIEF STEPS**

Overall, the clustering configuration can be performed as below.

-   Shared disk preparation

-   Install Tibero and unixODBC for Tibero TAC environment\
    - unixODBC configuration must be set for TAC

-   Install OpenFrame modules on node 1 only\
    - After the installation, some OpenFrame directories must be moved
    to /efs/oframe/\
    - Symbolc link must be done accordingly.\
    - TMAX must be properly configured for clustering as well.\
    - JEUS also must be configured for Tibero TAC environment.

    2.  **TIBERO SID CONFIGURATION**

Database SID will be set as below with \$TB\_HOME/client/tbdsn.tbr

  **Environment**   **SID**   **Note**
  ----------------- --------- -------------------------------------------------------------
  NODE 1 Only       tac1      Both IP addresses for NODE1 and NODE2 will be used by JEUS.
  NODE 2 Only       tac2      
  TAC (Common)      TVSAM     TVSAM SID will be used by UnixODBC.

**\
**

Preparation
-----------

At least two EC2 instance servers must be prepared on AWS along with a
shared disk beforehand.

**2-1. SHARED DISK (NODE 1, NODE 2)**

Shared disk needs to be prepared first and mounted as /efs directory.
For a better performance, the servers and shared disks both must be in
the same zone.

Please mount on both nodes so that they can access data from a shared
disk.

**A NEW DRIVE MOUNT FOR AWS ENVIRONMENT**

For the AWS environment, the following example can be used.

  ---- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  \$   sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 \$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).fs-efa56fa6.efs.us-east-1.amazonaws.com:/ efs
  ---- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

For details on the EFS installation and mount (AWS), please refer to the
following URL:

<http://docs.aws.amazon.com/efs/latest/ug/mounting-fs.html>

**EFS DIRECTORY CREATION (ONLY NODE 1)**

Create the following directories with relevant permissions.

  **Directory**   **Privilege**
  --------------- ---------------
  /efs/oframe     oframe:mqm
  /efs/oftibr     oftibr:dba

+-----------------------------------+-----------------------------------+
| \$                                | sudo mkdir /efs/oframe            |
|                                   |                                   |
| \$                                | sudo mkdir /efs/oftibr            |
|                                   |                                   |
| \$                                | chown -R oframe:mqm /efs/oframe   |
|                                   |                                   |
| \$                                | chown -R oftibr:dba /efs/oftibr   |
|                                   |                                   |
| \$                                | su - oftibr                       |
|                                   |                                   |
| \$                                | mkdir -p /efs/oftibr/database/cm  |
|                                   | \# TBCM directory needs to be     |
|                                   | created earlier                   |
+-----------------------------------+-----------------------------------+

After typing the above command on node 1, then the changes will be
automatically made to the node 2 as well.

Therefore, it is not necessary to type the same commands on node 2.

**2-2. ADDITIONAL NETWORK INTERFACE CARD (NODE 1, NODE 2)**

Additional network interface card must be installed and configured for
the interconnection of TAC environment.

The IP address assigned to the NIC will be used for Tibero instances.

+----+----------------------------------------------------------------------+
| \$ | ifconfig                                                             |
|    |                                                                      |
|    | eth0 Link encap:Ethernet HWaddr 12:01:F5:6E:83:B5                    |
|    |                                                                      |
|    | inet addr:XXX.XX.XX.X Bcast:XXX.XX.XX.XXX Mask:255.255.240.0         |
|    |                                                                      |
|    | inet6 addr: fe80::1001:f5ff:fe6e:83b5/64 Scope:Link                  |
|    |                                                                      |
|    | UP BROADCAST RUNNING MULTICAST MTU:9001 Metric:1                     |
|    |                                                                      |
|    | RX packets:13117397 errors:0 dropped:0 overruns:0 frame:0            |
|    |                                                                      |
|    | TX packets:13673189 errors:0 dropped:0 overruns:0 carrier:0          |
|    |                                                                      |
|    | collisions:0 txqueuelen:1000                                         |
|    |                                                                      |
|    | RX bytes:8563168972 (7.9 GiB) TX bytes:5314847303 (4.9 GiB)          |
|    |                                                                      |
|    | Interrupt:154                                                        |
|    |                                                                      |
|    | **eth1** Link encap:Ethernet HWaddr 12:98:BB:68:89:96                |
|    |                                                                      |
|    | inet addr:**XXX.XX.XX.XX** Bcast:**XXX.XX.XXX.XXX** Mask:255.255.0.0 |
|    |                                                                      |
|    | inet6 addr: fe80::1098:bbff:fe68:8996/64 Scope:Link                  |
|    |                                                                      |
|    | UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1                     |
|    |                                                                      |
|    | RX packets:12014 errors:0 dropped:0 overruns:0 frame:0               |
|    |                                                                      |
|    | TX packets:39 errors:0 dropped:0 overruns:0 carrier:0                |
|    |                                                                      |
|    | collisions:0 txqueuelen:1000                                         |
|    |                                                                      |
|    | RX bytes:505858 (494.0 KiB) TX bytes:2740 (2.6 KiB)                  |
|    |                                                                      |
|    | Interrupt:153                                                        |
|    |                                                                      |
|    | lo Link encap:Local Loopback                                         |
|    |                                                                      |
|    | inet addr:127.0.0.1 Mask:255.0.0.0                                   |
|    |                                                                      |
|    | inet6 addr: ::1/128 Scope:Host                                       |
|    |                                                                      |
|    | UP LOOPBACK RUNNING MTU:65536 Metric:1                               |
|    |                                                                      |
|    | RX packets:2918731 errors:0 dropped:0 overruns:0 frame:0             |
|    |                                                                      |
|    | TX packets:2918731 errors:0 dropped:0 overruns:0 carrier:0           |
|    |                                                                      |
|    | collisions:0 txqueuelen:0                                            |
|    |                                                                      |
|    | RX bytes:545892279 (520.6 MiB) TX bytes:545892279 (520.6 MiB)        |
+----+----------------------------------------------------------------------+

A new NIC will be assigned as eth1 on RedHat/CentOS 6 by default.
However, RedHat/CentOS 7 or onwards will display a different name.

**2-3. HOSTNAME CONFIGURATION (NODE1, NODE2)**

Specify the hostname on the two servers.

+-----------------------------------+-----------------------------------+
| \$                                | cat /etc/hosts                    |
|                                   |                                   |
|                                   | 127.0.0.1 localhost               |
|                                   | localhost.localdomain localhost4  |
|                                   | localhost4.localdomain4           |
|                                   |                                   |
|                                   | ::1 localhost                     |
|                                   | localhost.localdomain localhost6  |
|                                   | localhost6.localdomain6           |
|                                   |                                   |
|                                   | **172.31.60.2 tmaxaws1**          |
|                                   |                                   |
|                                   | **172.31.52.251 tmaxaws2**        |
+-----------------------------------+-----------------------------------+

**\
**

Installation
------------

**3-1. TIBERO**

+-----------------------------------+-----------------------------------+
| NODE 1, NODE 2                    | Copy the Tibero software to the   |
|                                   | Tibero user account.              |
|                                   |                                   |
|                                   | Unzip and untar the installer     |
|                                   | file using oftibr user. Move the  |
|                                   | extracted tibero6 directory to    |
|                                   | home location of oftibr.          |
|                                   |                                   |
|                                   | +--------------+--------------+   |
|                                   | | \$           | tar -xzvf    |   |
|                                   | |              | tibero6-bin- |   |
|                                   | | \$           | 6\_rel\_FS04 |   |
|                                   | |              | -linux64-121 |   |
|                                   | | \$           | 793-opt-test |   |
|                                   | |              | ed.tar.gz    |   |
|                                   | |              |              |   |
|                                   | |              | or           |   |
|                                   | |              |              |   |
|                                   | |              | gzip -d      |   |
|                                   | |              | tibero6-bin- |   |
|                                   | |              | 6\_rel\_FS04 |   |
|                                   | |              | -linux64-121 |   |
|                                   | |              | 793-opt-test |   |
|                                   | |              | ed.tar.gz    |   |
|                                   | |              |              |   |
|                                   | |              | tar -xvf     |   |
|                                   | |              | tibero6-bin- |   |
|                                   | |              | 6\_rel\_FS04 |   |
|                                   | |              | -linux64-121 |   |
|                                   | |              | 793-opt-test |   |
|                                   | |              | ed.tar       |   |
|                                   | +--------------+--------------+   |
|                                   |                                   |
|                                   |   ---- -------------------------  |
|                                   |   \$   mv tibero6 /opt/tmaxdb/    |
|                                   |   ---- -------------------------  |
+-----------------------------------+-----------------------------------+

+-----------------------------------+-----------------------------------+
| NODE 1                            | Update the .bash\_profile of      |
|                                   | Tibero user - oftibr.             |
|                                   |                                   |
|                                   | +------------------------------+  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#         |  |
|                                   | |                              |  |
|                                   | | \#                           |  |
|                                   | |                              |  |
|                                   | | \# TSAM/TIBERO (or TIBERO    |  |
|                                   | | VSAM)                        |  |
|                                   | |                              |  |
|                                   | | \#                           |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#           |  |
|                                   | |                              |  |
|                                   | | TB\_HOME=/opt/tmaxdb/tibero6 |  |
|                                   | | ;                            |  |
|                                   | | export TB\_HOME              |  |
|                                   | |                              |  |
|                                   | | TB\_SID=**tac1**; export     |  |
|                                   | | TB\_SID                      |  |
|                                   | |                              |  |
|                                   | | SEM\_KEY=148050; export      |  |
|                                   | | SEM\_KEY                     |  |
|                                   | |                              |  |
|                                   | | TB\_PROF\_DIR=\$TB\_HOME/bin |  |
|                                   | | /prof;                       |  |
|                                   | | export TB\_PROF\_DIR         |  |
|                                   | |                              |  |
|                                   | | PATH=\$TB\_HOME/script:\$TB\ |  |
|                                   | | _HOME/bin:\$TB\_HOME/client/ |  |
|                                   | | bin:\$PATH;                  |  |
|                                   | | export PATH                  |  |
|                                   | |                              |  |
|                                   | | LD\_LIBRARY\_PATH=\$TB\_HOME |  |
|                                   | | /lib:\$TB\_HOME/client/lib:/ |  |
|                                   | | lib:\$LD\_LIBRARY\_PATH;     |  |
|                                   | | export LD\_LIBRARY\_PATH     |  |
|                                   | |                              |  |
|                                   | | LD\_LIBRARY\_PATH\_64=\$TB\_ |  |
|                                   | | HOME/lib:\$TB\_HOME/client/l |  |
|                                   | | ib:\$LD\_LIBRARY\_PATH\_64;  |  |
|                                   | | export LD\_LIBRARY\_PATH\_64 |  |
|                                   | |                              |  |
|                                   | | export                       |  |
|                                   | | TB\_NLS\_DATE\_FORMAT=\"YYYY |  |
|                                   | | /MM/DD                       |  |
|                                   | | HH24:MI:SS\"                 |  |
|                                   | |                              |  |
|                                   | | TBMON\_HOME=\$TB\_HOME/tbmon |  |
|                                   | | ;                            |  |
|                                   | | export TBMON\_HOME           |  |
|                                   | |                              |  |
|                                   | | AIXTHREAD\_SCOPE=S; export   |  |
|                                   | | AIXTHREAD\_SCOPE             |  |
|                                   | |                              |  |
|                                   | | TB\_CONN\_TIMEOUT=10; export |  |
|                                   | | TB\_CONN\_TIMEOUT            |  |
|                                   | |                              |  |
|                                   | | TB\_READ\_TIMEOUT=180;       |  |
|                                   | | export TB\_READ\_TIMEOUT     |  |
|                                   | +------------------------------+  |
                                                                       
+===================================+===================================+
| NODE 2                            | Update the .bash\_profile of      |
|                                   | Tibero user - oftibr.             |
|                                   |                                   |
|                                   | +------------------------------+  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#         |  |
|                                   | |                              |  |
|                                   | | \#                           |  |
|                                   | |                              |  |
|                                   | | \# TSAM/TIBERO (or TIBERO    |  |
|                                   | | VSAM)                        |  |
|                                   | |                              |  |
|                                   | | \#                           |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#           |  |
|                                   | |                              |  |
|                                   | | TB\_HOME=/opt/tmaxdb/tibero6 |  |
|                                   | | ;                            |  |
|                                   | | export TB\_HOME              |  |
|                                   | |                              |  |
|                                   | | TB\_SID=**tac2**; export     |  |
|                                   | | TB\_SID                      |  |
|                                   | |                              |  |
|                                   | | SEM\_KEY=148050; export      |  |
|                                   | | SEM\_KEY                     |  |
|                                   | |                              |  |
|                                   | | TB\_PROF\_DIR=\$TB\_HOME/bin |  |
|                                   | | /prof;                       |  |
|                                   | | export TB\_PROF\_DIR         |  |
|                                   | |                              |  |
|                                   | | PATH=\$TB\_HOME/script:\$TB\ |  |
|                                   | | _HOME/bin:\$TB\_HOME/client/ |  |
|                                   | | bin:\$PATH;                  |  |
|                                   | | export PATH                  |  |
|                                   | |                              |  |
|                                   | | LD\_LIBRARY\_PATH=\$TB\_HOME |  |
|                                   | | /lib:\$TB\_HOME/client/lib:/ |  |
|                                   | | lib:\$LD\_LIBRARY\_PATH;     |  |
|                                   | | export LD\_LIBRARY\_PATH     |  |
|                                   | |                              |  |
|                                   | | LD\_LIBRARY\_PATH\_64=\$TB\_ |  |
|                                   | | HOME/lib:\$TB\_HOME/client/l |  |
|                                   | | ib:\$LD\_LIBRARY\_PATH\_64;  |  |
|                                   | | export LD\_LIBRARY\_PATH\_64 |  |
|                                   | |                              |  |
|                                   | | export                       |  |
|                                   | | TB\_NLS\_DATE\_FORMAT=\"YYYY |  |
|                                   | | /MM/DD                       |  |
|                                   | | HH24:MI:SS\"                 |  |
|                                   | |                              |  |
|                                   | | TBMON\_HOME=\$TB\_HOME/tbmon |  |
|                                   | | ;                            |  |
|                                   | | export TBMON\_HOME           |  |
|                                   | |                              |  |
|                                   | | AIXTHREAD\_SCOPE=S; export   |  |
|                                   | | AIXTHREAD\_SCOPE             |  |
|                                   | |                              |  |
|                                   | | TB\_CONN\_TIMEOUT=10; export |  |
|                                   | | TB\_CONN\_TIMEOUT            |  |
|                                   | |                              |  |
|                                   | | TB\_READ\_TIMEOUT=180;       |  |
|                                   | | export TB\_READ\_TIMEOUT     |  |
|                                   | +------------------------------+  |
+-----------------------------------+-----------------------------------+
| NODE 1, NODE 2                    | Execute the shell profile.        |
|                                   |                                   |
|                                   | +----+------------------+         |
|                                   | | \$ | cd               |         |
|                                   | |    |                  |         |
|                                   | | \$ | . .bash\_profile |         |
|                                   | +----+------------------+         |
|                                   |                                   |
|                                   | Copy the Tibero license file to   |
|                                   | \$TB\_HOME/license                |
|                                   |                                   |
|                                   |   ---- -------------------------- |
|                                   | --------------------------------- |
|                                   | -------                           |
|                                   |   \$   ln -s /opt/tmaxapp/ofsw/of |
|                                   | license/tibero/license.xml licens |
|                                   | e.xml                             |
|                                   |   ---- -------------------------- |
|                                   | --------------------------------- |
|                                   | -------                           |
|                                   |                                   |
|                                   | Execute the gen\_tip file         |
|                                   |                                   |
|                                   | +--------------+--------------+   |
|                                   | | \$           | cd           |   |
|                                   | |              | /opt/tmaxdb/ |   |
|                                   | | \$           | tibero6/conf |   |
|                                   | |              | ig           |   |
|                                   | |              |              |   |
|                                   | |              | sh           |   |
|                                   | |              | gen\_tip.sh  |   |
|                                   | |              |              |   |
|                                   | |              | Using        |   |
|                                   | |              | TB\_SID      |   |
|                                   | |              | \"TVSAM\"    |   |
|                                   | |              |              |   |
|                                   | |              | /opt/tmaxdb/ |   |
|                                   | |              | tibero6/conf |   |
|                                   | |              | ig/TVSAM.tip |   |
|                                   | |              | generated    |   |
|                                   | |              |              |   |
|                                   | |              | /opt/tmaxdb/ |   |
|                                   | |              | tibero6/conf |   |
|                                   | |              | ig/psm\_comm |   |
|                                   | |              | ands         |   |
|                                   | |              | generated    |   |
|                                   | |              |              |   |
|                                   | |              | /opt/tmaxdb/ |   |
|                                   | |              | tibero6/clie |   |
|                                   | |              | nt/config/tb |   |
|                                   | |              | dsn.tbr      |   |
|                                   | |              | generated.   |   |
|                                   | |              |              |   |
|                                   | |              | Running      |   |
|                                   | |              | client/confi |   |
|                                   | |              | g/gen\_esql\ |   |
|                                   | |              | _cfg.sh      |   |
|                                   | |              |              |   |
|                                   | |              | Done.        |   |
|                                   | +--------------+--------------+   |
|                                   |                                   |
|                                   | Change the                        |
|                                   | \$TB\_HOME/client/config/tbdsn.tb |
|                                   | r                                 |
|                                   | as follows.                       |
|                                   |                                   |
|                                   | +------------------------------+  |
|                                   | | \#\-\-\-\-\-\-\-\-\-\-\-\-\- |  |
|                                   | | \-\-\-\-\-\-\-\-\-\-\-\-\-\- |  |
|                                   | | \-\-\-\-\-\-\-\-\-\-\-\-\-\- |  |
|                                   | | \-\-\-\-\-\-\--              |  |
|                                   | |                              |  |
|                                   | | \#                           |  |
|                                   | | /opt/tmaxdb/tibero6/client/c |  |
|                                   | | onfig/tbdsn.tbr              |  |
|                                   | |                              |  |
|                                   | | \# Network Configuration     |  |
|                                   | | File.                        |  |
|                                   | |                              |  |
|                                   | | \# Generated by gen\_tip.sh  |  |
|                                   | | at Tue Oct 11 15:31:50 EDT   |  |
|                                   | | 2016                         |  |
|                                   | |                              |  |
|                                   | | tac1=(                       |  |
|                                   | |                              |  |
|                                   | | (INSTANCE=(HOST=172.31.60.2) |  |
|                                   | |                              |  |
|                                   | | (PORT=8629)                  |  |
|                                   | |                              |  |
|                                   | | (DB\_NAME=TVSAM)             |  |
|                                   | |                              |  |
|                                   | | )                            |  |
|                                   | |                              |  |
|                                   | | )                            |  |
|                                   | |                              |  |
|                                   | | tac2=(                       |  |
|                                   | |                              |  |
|                                   | | (INSTANCE=(HOST=172.31.52.25 |  |
|                                   | | 1)                           |  |
|                                   | |                              |  |
|                                   | | (PORT=8629)                  |  |
|                                   | |                              |  |
|                                   | | (DB\_NAME=TVSAM)             |  |
|                                   | |                              |  |
|                                   | | )                            |  |
|                                   | |                              |  |
|                                   | | )                            |  |
|                                   | |                              |  |
|                                   | | **TVSAM**=(                  |  |
|                                   | |                              |  |
|                                   | | (INSTANCE=(HOST=172.31.60.2) |  |
|                                   | |                              |  |
|                                   | | (PORT=8629)                  |  |
|                                   | |                              |  |
|                                   | | (DB\_NAME=TVSAM)             |  |
|                                   | |                              |  |
|                                   | | )                            |  |
|                                   | |                              |  |
|                                   | | (INSTANCE=(HOST=172.31.52.25 |  |
|                                   | | 1)                           |  |
|                                   | |                              |  |
|                                   | | (PORT=8629)                  |  |
|                                   | |                              |  |
|                                   | | (DB\_NAME=TVSAM)             |  |
|                                   | |                              |  |
|                                   | | )                            |  |
|                                   | |                              |  |
|                                   | | (LOAD\_BALANCE=Y)            |  |
|                                   | |                              |  |
|                                   | | (USE\_FAILOVER=Y)            |  |
|                                   | |                              |  |
|                                   | | )                            |  |
|                                   | +------------------------------+  |
+-----------------------------------+-----------------------------------+
| NODE 1                            | Change the                        |
|                                   | \$TB\_HOME/config/\$TB\_SID.tip.  |
|                                   |                                   |
|                                   | +------------------------------+  |
|                                   | | DB\_NAME=TVSAM               |  |
|                                   | |                              |  |
|                                   | | LISTENER\_PORT=8629          |  |
|                                   | |                              |  |
|                                   | | \#CERTIFICATE\_FILE=\"/opt/t |  |
|                                   | | maxdb/tibero6/config/svr\_wa |  |
|                                   | | llet/TVSAM.crt\"             |  |
|                                   | |                              |  |
|                                   | | \#PRIVKEY\_FILE=\"/opt/tmaxd |  |
|                                   | | b/tibero6/config/svr\_wallet |  |
|                                   | | /TVSAM.key\"                 |  |
|                                   | |                              |  |
|                                   | | \#WALLET\_FILE=\"/opt/tmaxdb |  |
|                                   | | /tibero6/config/svr\_wallet/ |  |
|                                   | | WALLET\"                     |  |
|                                   | |                              |  |
|                                   | | \#EVENT\_TRACE\_MAP=\"/opt/t |  |
|                                   | | maxdb/tibero6/config/event.m |  |
|                                   | | ap\"                         |  |
|                                   | |                              |  |
|                                   | | MAX\_SESSION\_COUNT=200      |  |
|                                   | |                              |  |
|                                   | | TOTAL\_SHM\_SIZE=1G          |  |
|                                   | |                              |  |
|                                   | | MEMORY\_TARGET=2G            |  |
|                                   | |                              |  |
|                                   | | \#WTHR\_PROC\_CNT=8          |  |
|                                   | |                              |  |
|                                   | | \#\_WTHR\_PER\_PROC=15       |  |
|                                   | |                              |  |
|                                   | | \_STMT\_DD\_CSR\_MODE=N      |  |
|                                   | |                              |  |
|                                   | | CONTROL\_FILES=\"/efs/oftibr |  |
|                                   | | /database/c1.ctl\",\"/efs/of |  |
|                                   | | tibr/database/c2.ctl\"       |  |
|                                   | |                              |  |
|                                   | | DB\_CREATE\_FILE\_DEST=\"/ef |  |
|                                   | | s/oftibr/database\"          |  |
|                                   | |                              |  |
|                                   | | LOG\_ARCHIVE\_DEST=\"/opt/tm |  |
|                                   | | axdb/tibero6/database/archiv |  |
|                                   | | e1\"                         |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | |                              |  |
|                                   | | \#\# CM Setting              |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | |                              |  |
|                                   | | CM\_CLUSTER\_MODE=ACTIVE\_SH |  |
|                                   | | ARED                         |  |
|                                   | |                              |  |
|                                   | | CM\_PORT=18629               |  |
|                                   | |                              |  |
|                                   | | LOCAL\_CLUSTER\_ADDR=**172.3 |  |
|                                   | | 1.60.2**                     |  |
|                                   | |                              |  |
|                                   | | **\# Private network IP of   |  |
|                                   | | node 1**                     |  |
|                                   | |                              |  |
|                                   | | LOCAL\_CLUSTER\_PORT=28629   |  |
|                                   | |                              |  |
|                                   | | CM\_FILE\_NAME=/efs/oftibr/d |  |
|                                   | | atabase/cm/cmfile,/efs/oftib |  |
|                                   | | r/database/cm/cmfile2        |  |
|                                   | |                              |  |
|                                   | | \#CM\_TIME\_UNIT=10          |  |
|                                   | |                              |  |
|                                   | | \#CM\_HEARTBEAT\_EXPIRE=320  |  |
|                                   | |                              |  |
|                                   | | \#CM\_WATCHDOG\_EXPIRE=280   |  |
|                                   | |                              |  |
|                                   | | CM\_NAME=**node1**           |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | |                              |  |
|                                   | | \#\# TAC Setting             |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | |                              |  |
|                                   | | CLUSTER\_DATABASE=Y          |  |
|                                   | |                              |  |
|                                   | | THREAD=**0**                 |  |
|                                   | |                              |  |
|                                   | | UNDO\_TABLESPACE=**UNDO0**   |  |
|                                   | +------------------------------+  |
+-----------------------------------+-----------------------------------+
| NODE 2                            | Change the                        |
|                                   | \$TB\_HOME/config/\$TB\_SID.tip.  |
|                                   |                                   |
|                                   | +------------------------------+  |
|                                   | | DB\_NAME=TVSAM               |  |
|                                   | |                              |  |
|                                   | | LISTENER\_PORT=8629          |  |
|                                   | |                              |  |
|                                   | | \#CERTIFICATE\_FILE=\"/opt/t |  |
|                                   | | maxdb/tibero6/config/svr\_wa |  |
|                                   | | llet/TVSAM.crt\"             |  |
|                                   | |                              |  |
|                                   | | \#PRIVKEY\_FILE=\"/opt/tmaxd |  |
|                                   | | b/tibero6/config/svr\_wallet |  |
|                                   | | /TVSAM.key\"                 |  |
|                                   | |                              |  |
|                                   | | \#WALLET\_FILE=\"/opt/tmaxdb |  |
|                                   | | /tibero6/config/svr\_wallet/ |  |
|                                   | | WALLET\"                     |  |
|                                   | |                              |  |
|                                   | | \#EVENT\_TRACE\_MAP=\"/opt/t |  |
|                                   | | maxdb/tibero6/config/event.m |  |
|                                   | | ap\"                         |  |
|                                   | |                              |  |
|                                   | | MAX\_SESSION\_COUNT=200      |  |
|                                   | |                              |  |
|                                   | | TOTAL\_SHM\_SIZE=1G          |  |
|                                   | |                              |  |
|                                   | | MEMORY\_TARGET=2G            |  |
|                                   | |                              |  |
|                                   | | \#WTHR\_PROC\_CNT=8          |  |
|                                   | |                              |  |
|                                   | | \#\_WTHR\_PER\_PROC=15       |  |
|                                   | |                              |  |
|                                   | | \_STMT\_DD\_CSR\_MODE=N      |  |
|                                   | |                              |  |
|                                   | | CONTROL\_FILES=\"/efs/oftibr |  |
|                                   | | /database/c1.ctl\",\"/efs/of |  |
|                                   | | tibr/database/c2.ctl\"       |  |
|                                   | |                              |  |
|                                   | | DB\_CREATE\_FILE\_DEST=\"/ef |  |
|                                   | | s/oftibr/database\"          |  |
|                                   | |                              |  |
|                                   | | LOG\_ARCHIVE\_DEST=\"/opt/tm |  |
|                                   | | axdb/tibero6/database/archiv |  |
|                                   | | e2\"                         |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | |                              |  |
|                                   | | \#\# CM Setting              |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | |                              |  |
|                                   | | CM\_CLUSTER\_MODE=ACTIVE\_SH |  |
|                                   | | ARED                         |  |
|                                   | |                              |  |
|                                   | | CM\_PORT=18629               |  |
|                                   | |                              |  |
|                                   | | LOCAL\_CLUSTER\_ADDR=**172.3 |  |
|                                   | | 1.52.251**                   |  |
|                                   | |                              |  |
|                                   | | **\# Private network IP of   |  |
|                                   | | node 2**                     |  |
|                                   | |                              |  |
|                                   | | LOCAL\_CLUSTER\_PORT=28629   |  |
|                                   | |                              |  |
|                                   | | CM\_FILE\_NAME=/efs/oftibr/d |  |
|                                   | | atabase/cm/cmfile,/efs/oftib |  |
|                                   | | r/database/cm/cmfile2        |  |
|                                   | |                              |  |
|                                   | | \#CM\_TIME\_UNIT=10          |  |
|                                   | |                              |  |
|                                   | | \#CM\_HEARTBEAT\_EXPIRE=320  |  |
|                                   | |                              |  |
|                                   | | \#CM\_WATCHDOG\_EXPIRE=280   |  |
|                                   | |                              |  |
|                                   | | CM\_NAME=**node2**           |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | |                              |  |
|                                   | | \#\# TAC Setting             |  |
|                                   | |                              |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | | \#\#\#\#\#\#\#\#\#\#\#\#\#\# |  |
|                                   | |                              |  |
|                                   | | CLUSTER\_DATABASE=Y          |  |
|                                   | |                              |  |
|                                   | | THREAD=**1**                 |  |
|                                   | |                              |  |
|                                   | | UNDO\_TABLESPACE=**UNDO01**  |  |
|                                   | +------------------------------+  |
+-----------------------------------+-----------------------------------+
| NODE 1                            | Configure the database on node 1. |
|                                   |                                   |
|                                   | +--------------+--------------+   |
|                                   | | \$           | tbcm -b      |   |
|                                   | |              |              |   |
|                                   | | \$           | tbboot       |   |
|                                   | |              |              |   |
|                                   | | \$           | tbsql        |   |
|                                   | |              | sys/tibero   |   |
|                                   | | SQL\>        |              |   |
|                                   | |              | CREATE       |   |
|                                   | | \$           | DATABASE     |   |
|                                   | |              | \"TVSAM\"    |   |
|                                   | | \$           |              |   |
|                                   | |              | USER SYS     |   |
|                                   | | SQL\>        | IDENTIFIED   |   |
|                                   | |              | BY tibero    |   |
|                                   | | \$           |              |   |
|                                   | |              | CHARACTER    |   |
|                                   | | \$           | SET UTF8     |   |
|                                   | |              |              |   |
|                                   | |              | LOGFILE      |   |
|                                   | |              | GROUP 1      |   |
|                                   | |              | \'log0001.lo |   |
|                                   | |              | g\'          |   |
|                                   | |              | SIZE 512M,   |   |
|                                   | |              |              |   |
|                                   | |              | GROUP 2      |   |
|                                   | |              | \'log0002.lo |   |
|                                   | |              | g\'          |   |
|                                   | |              | SIZE 512M,   |   |
|                                   | |              |              |   |
|                                   | |              | GROUP 3      |   |
|                                   | |              | \'log0003.lo |   |
|                                   | |              | g\'          |   |
|                                   | |              | SIZE 512M    |   |
|                                   | |              |              |   |
|                                   | |              | MAXLOGGROUPS |   |
|                                   | |              | 255          |   |
|                                   | |              |              |   |
|                                   | |              | MAXLOGMEMBER |   |
|                                   | |              | S            |   |
|                                   | |              | 8            |   |
|                                   | |              |              |   |
|                                   | |              | ARCHIVELOG   |   |
|                                   | |              |              |   |
|                                   | |              | DATAFILE     |   |
|                                   | |              | \'system001. |   |
|                                   | |              | dtf\'        |   |
|                                   | |              | SIZE 64M     |   |
|                                   | |              |              |   |
|                                   | |              | AUTOEXTEND   |   |
|                                   | |              | ON NEXT 64M  |   |
|                                   | |              |              |   |
|                                   | |              | DEFAULT      |   |
|                                   | |              | TEMPORARY    |   |
|                                   | |              | TABLESPACE   |   |
|                                   | |              | TEMP         |   |
|                                   | |              |              |   |
|                                   | |              | TEMPFILE     |   |
|                                   | |              | \'temp001.dt |   |
|                                   | |              | f\'          |   |
|                                   | |              | SIZE 512M    |   |
|                                   | |              |              |   |
|                                   | |              | AUTOEXTEND   |   |
|                                   | |              | ON NEXT 64M  |   |
|                                   | |              |              |   |
|                                   | |              | EXTENT       |   |
|                                   | |              | MANAGEMENT   |   |
|                                   | |              | LOCAL        |   |
|                                   | |              | AUTOALLOCATE |   |
|                                   | |              |              |   |
|                                   | |              | UNDO         |   |
|                                   | |              | TABLESPACE   |   |
|                                   | |              | UNDO0        |   |
|                                   | |              |              |   |
|                                   | |              | DATAFILE     |   |
|                                   | |              | \'undo0.dtf\ |   |
|                                   | |              | '            |   |
|                                   | |              | SIZE 512M    |   |
|                                   | |              |              |   |
|                                   | |              | AUTOEXTEND   |   |
|                                   | |              | ON NEXT 64M  |   |
|                                   | |              |              |   |
|                                   | |              | EXTENT       |   |
|                                   | |              | MANAGEMENT   |   |
|                                   | |              | LOCAL        |   |
|                                   | |              | AUTOALLOCATE |   |
|                                   | |              |              |   |
|                                   | |              | DEFAULT      |   |
|                                   | |              | TABLESPACE   |   |
|                                   | |              | usr          |   |
|                                   | |              |              |   |
|                                   | |              | DATAFILE     |   |
|                                   | |              | \'usr001.dtf |   |
|                                   | |              | \'           |   |
|                                   | |              | SIZE 128M    |   |
|                                   | |              |              |   |
|                                   | |              | AUTOEXTEND   |   |
|                                   | |              | ON NEXT 64M  |   |
|                                   | |              | MAXSIZE      |   |
|                                   | |              | UNLIMITED    |   |
|                                   | |              |              |   |
|                                   | |              | EXTENT       |   |
|                                   | |              | MANAGEMENT   |   |
|                                   | |              | LOCAL        |   |
|                                   | |              | AUTOALLOCATE |   |
|                                   | |              | ;            |   |
|                                   | |              |              |   |
|                                   | |              | tbboot       |   |
|                                   | |              |              |   |
|                                   | |              | tbsql        |   |
|                                   | |              | sys/tibero   |   |
|                                   | |              |              |   |
|                                   | |              | create undo  |   |
|                                   | |              | tablespace   |   |
|                                   | |              | UNDO01       |   |
|                                   | |              | datafile     |   |
|                                   | |              | \'undo01.dtf |   |
|                                   | |              | \'           |   |
|                                   | |              | size 512M    |   |
|                                   | |              | autoextend   |   |
|                                   | |              | on next 64m; |   |
|                                   | |              |              |   |
|                                   | |              | create       |   |
|                                   | |              | tablespace   |   |
|                                   | |              | \"DEFVOL\"   |   |
|                                   | |              | datafile     |   |
|                                   | |              | \'DEFVOL.dbf |   |
|                                   | |              | \'           |   |
|                                   | |              | size 300M    |   |
|                                   | |              | autoextend   |   |
|                                   | |              | on;          |   |
|                                   | |              |              |   |
|                                   | |              | create       |   |
|                                   | |              | tablespace   |   |
|                                   | |              | \"TACF00\"   |   |
|                                   | |              | datafile     |   |
|                                   | |              | \'TACF00.dbf |   |
|                                   | |              | \'           |   |
|                                   | |              | size 100M    |   |
|                                   | |              | autoextend   |   |
|                                   | |              | on;          |   |
|                                   | |              |              |   |
|                                   | |              | alter        |   |
|                                   | |              | database add |   |
|                                   | |              | logfile      |   |
|                                   | |              | thread 1     |   |
|                                   | |              | group 4      |   |
|                                   | |              | \'/efs/oftib |   |
|                                   | |              | r/database/l |   |
|                                   | |              | og0004.log\' |   |
|                                   | |              | size 512M;   |   |
|                                   | |              |              |   |
|                                   | |              | alter        |   |
|                                   | |              | database add |   |
|                                   | |              | logfile      |   |
|                                   | |              | thread 1     |   |
|                                   | |              | group 5      |   |
|                                   | |              | \'/efs/oftib |   |
|                                   | |              | r/database/l |   |
|                                   | |              | og0005.log\' |   |
|                                   | |              | size 512M;   |   |
|                                   | |              |              |   |
|                                   | |              | alter        |   |
|                                   | |              | database add |   |
|                                   | |              | logfile      |   |
|                                   | |              | thread 1     |   |
|                                   | |              | group 6      |   |
|                                   | |              | \'/efs/oftib |   |
|                                   | |              | r/database/l |   |
|                                   | |              | og0006.log\' |   |
|                                   | |              | size 512M;   |   |
|                                   | |              |              |   |
|                                   | |              | alter        |   |
|                                   | |              | database     |   |
|                                   | |              | enable       |   |
|                                   | |              | public       |   |
|                                   | |              | thread 1;    |   |
|                                   | |              |              |   |
|                                   | |              | cd           |   |
|                                   | |              | \$TB\_HOME/s |   |
|                                   | |              | cripts       |   |
|                                   | |              | && sh        |   |
|                                   | |              | system.sh    |   |
|                                   | |              |              |   |
|                                   | |              | tbdown       |   |
|                                   | +--------------+--------------+   |
+-----------------------------------+-----------------------------------+
| NODE 2                            | Boots up Tibero Cluster Manager   |
|                                   | on Node 2.                        |
|                                   |                                   |
|                                   |   ---- ---------                  |
|                                   |   \$   tbcm -b                    |
|                                   |   ---- ---------                  |
+-----------------------------------+-----------------------------------+
| NODE 1                            | Boots up Tibero instance on Node  |
|                                   | 1.                                |
|                                   |                                   |
|                                   |   ---- --------                   |
|                                   |   \$   tbboot                     |
|                                   |   ---- --------                   |
+-----------------------------------+-----------------------------------+
| NODE 2                            | Boots up Tibero instance on Node  |
|                                   | 2.                                |
|                                   |                                   |
|                                   |   ---- --------                   |
|                                   |   \$   tbboot                     |
|                                   |   ---- --------                   |
+-----------------------------------+-----------------------------------+

**3-2. UNIXODBC**

**UnixODBC Configuration (Node 1 & Node 2)**

Install UnixODBC as described in the OpenFrame7\_fix2\_installation
guide.

Please check the SID portion in odbc.ini.

+------------------------------------------------------+
| \[ODBC Data Sources\]                                |
|                                                      |
| tibero6 = Tibero6 ODBC driver                        |
|                                                      |
| \[TVSAM\]                                            |
|                                                      |
| Driver = /opt/tmaxdb/tibero6/client/lib/libtbodbc.so |
|                                                      |
| Description = Tibero ODBC driver for Tibero6         |
|                                                      |
| DSN = TVSAM                                          |
|                                                      |
| **SID = TVSAM**                                      |
|                                                      |
| User = tibero                                        |
|                                                      |
| Password = tmax                                      |
+------------------------------------------------------+

The SID "TVSAM" will be used as TAC, which must be also set in
\$TB\_HOME/config/tbdsn.tbr.

**3-3. OPEPNFRAME MODULDES SETUP**

**INSTALLATION AND DIRECTORY LINKING (NODE 1)**

For details about OpenFrame module installation, please refer to
OpenFrame7\_fix2\_installation guide.

Install OpenFrame modules on **NODE 1 ONLY**.

After the OpenFrame installation, terminate every OpenFrame engines.
Also, please move some OpenFrame-related directories (output, profile,
shared, spbackup, spool, spunpack, temp, and volume\_default) to EFS and
make a symbolc link to the directories.

+----+---------------------------------------------------------------------+
| \$ | mv \$OPENFRAME\_HOME/outputq /efs/oframe/outputq                    |
|    |                                                                     |
| \$ | mv \$OPENFRAME\_HOME/profile /efs/oframe/profile                    |
|    |                                                                     |
| \$ | mv \$OPENFRAME\_HOME/shared /efs/oframe/shared                      |
|    |                                                                     |
| \$ | mv \$OPENFRAME\_HOME/spbackup /efs/oframe/spbackup                  |
|    |                                                                     |
| \$ | mv \$OPENFRAME\_HOME/spool /efs/oframe/spool                        |
|    |                                                                     |
| \$ | mv \$OPENFRAME\_HOME/spunpack /efs/oframe/spunpack                  |
|    |                                                                     |
| \$ | mv \$OPENFRAME\_HOME/temp /efs/oframe/temp                          |
|    |                                                                     |
| \$ | mv \$OPENFRAME\_HOME/volume\_default /efs/oframe/volume\_default    |
|    |                                                                     |
| \$ | ln -s /efs/oframe/outputq                                           |
|    |                                                                     |
| \$ | ln -s /efs/oframe/profile \$OPENFRAME\_HOME/outputq                 |
|    |                                                                     |
| \$ | ln -s /efs/oframe/shared \$OPENFRAME\_HOME/profile                  |
|    |                                                                     |
| \$ | ln -s /efs/oframe/spbackup \$OPENFRAME\_HOME/spbackup               |
|    |                                                                     |
| \$ | ln -s /efs/oframe/spool \$OPENFRAME\_HOME/spool                     |
|    |                                                                     |
| \$ | ln -s /efs/oframe/spunpack \$OPENFRAME\_HOME/spunpack               |
|    |                                                                     |
| \$ | ln -s /efs/oframe/temp \$OPENFRAME\_HOME/temp                       |
|    |                                                                     |
| \$ | ln -s /efs/oframe/volume\_default \$OPENFRAME\_HOME/volume\_default |
+----+---------------------------------------------------------------------+

**ADDITIONAL OPENFRAME CONFIGURATION (NODE1)**

Add the following option to \$OPENFRAME\_HOME/config/textrun.conf.

+-----------------------------------------------------------------------+
| \# Entry Descriptions:                                                |
|                                                                       |
| \# RUN\_NODE= set run node                                            |
|                                                                       |
| \# - default value is \* ( any node )                                 |
|                                                                       |
| \# SUBMIT\_DATASET= when -j paramater is DSNAME(MEMBER), set filepath |
| or dataset                                                            |
|                                                                       |
| \# - YES : DSNAME(MEMBER) is submitted by dataset, it means FB format |
| dataset can by submitted.                                             |
|                                                                       |
| \[OPTION\]                                                            |
|                                                                       |
| RUN\_NODE=\*                                                          |
+-----------------------------------------------------------------------+

**TJES CONFIGURATION (NODE1)**

Add the following option to \$OPENFARME\_HOME/config/tjes.conf.

+-------------------------+
| \[NODEINFO\]            |
|                         |
| \# DOMAINNAME=DOM1      |
|                         |
| \# DOMAINLIST=DOM1;DOM2 |
|                         |
| NODENAME=NODE1          |
|                         |
| NODELIST=NODE1;NODE2    |
+-------------------------+

**TMAX CONFIGURATION (NODE1)**

Modify the \$TMAXDIR/config/oframe.m.

+-----------------------------------------------------------------------+
| NODE1                                                                 |
|                                                                       |
| HOSTNAME = \"tmaxaws1\",                                              |
|                                                                       |
| TMAXDIR = \"/opt/tmaxapp/OpenFrame/core\",                            |
|                                                                       |
| APPDIR = \"/opt/tmaxapp/OpenFrame/core/appbin\",                      |
|                                                                       |
| TLOGDIR = \"/opt/tmaxapp/OpenFrame/log/tmax/tlog\",                   |
|                                                                       |
| ULOGDIR = \"/opt/tmaxapp/OpenFrame/log/tmax/ulog\",                   |
|                                                                       |
| SLOGDIR = \"/opt/tmaxapp/OpenFrame/log/tmax/slog\",                   |
|                                                                       |
| CLHOPT = \" -o /opt/tmaxapp/OpenFrame/log/tmax/clh.log -e             |
| /opt/tmaxapp/OpenFrame/log/tmax/clh.err\",                            |
|                                                                       |
| TPORTNO = 6623, SHMKEY = 63481,                                       |
|                                                                       |
| TMAXPORT = \"6623, 6291\",                                            |
|                                                                       |
| CLLUNBLKPORT = \"6291\",                                              |
|                                                                       |
| CLLBLOCK = NO,                                                        |
|                                                                       |
| MAXSPR = 172,                                                         |
|                                                                       |
| MAXSVR = 64,                                                          |
|                                                                       |
| RACPORT = 5100                                                        |
|                                                                       |
| \# RACPORT =                                                          |
|                                                                       |
| NODE2                                                                 |
|                                                                       |
| HOSTNAME = \"tmaxaws2\",                                              |
|                                                                       |
| TMAXDIR = \"/opt/tmaxapp/OpenFrame/core\",                            |
|                                                                       |
| APPDIR = \"/opt/tmaxapp/OpenFrame/core/appbin\",                      |
|                                                                       |
| TLOGDIR = \"/opt/tmaxapp/OpenFrame/log/tmax/tlog\",                   |
|                                                                       |
| ULOGDIR = \"/opt/tmaxapp/OpenFrame/log/tmax/ulog\",                   |
|                                                                       |
| SLOGDIR = \"/opt/tmaxapp/OpenFrame/log/tmax/slog\",                   |
|                                                                       |
| CLHOPT = \" -o /opt/tmaxapp/OpenFrame/log/tmax/clh.log -e             |
| /opt/tmaxapp/OpenFrame/log/tmax/clh.err\",                            |
|                                                                       |
| TPORTNO = 6623, SHMKEY = 63481,                                       |
|                                                                       |
| TMAXPORT = \"6623, 6291\",                                            |
|                                                                       |
| CLLUNBLKPORT = \"6291\",                                              |
|                                                                       |
| CLLBLOCK = NO,                                                        |
|                                                                       |
| MAXSPR = 172,                                                         |
|                                                                       |
| MAXSVR = 64,                                                          |
|                                                                       |
| RACPORT = 5100                                                        |
|                                                                       |
| \*SVRGROUP                                                            |
|                                                                       |
| svg\_domain1                                                          |
|                                                                       |
| NODENAME = \"NODE1\", BACKUP = \"svg\_domain2\"                       |
|                                                                       |
| svg\_domain2                                                          |
|                                                                       |
| NODENAME = \"NODE2\"                                                  |
|                                                                       |
| svg\_node1                                                            |
|                                                                       |
| NODENAME = \"NODE1\", COUSIN = \"svg\_node2\"                         |
|                                                                       |
| svg\_node2                                                            |
|                                                                       |
| NODENAME = \"NODE2\"                                                  |
|                                                                       |
| ofrsasvr SVGNAME = svg\_domain1, MIN = 1, MAX = 1, SVRTYPE=UCS,       |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| ofrlhsvr SVGNAME = svg\_node1,                                        |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| ofrdmsvr SVGNAME = svg\_domain1, MIN = 1, MAX = 1, SVRTYPE=UCS,       |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| ofrdsedt SVGNAME = svg\_node1, CONV=Y,                                |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| ofrcmsvr SVGNAME = svg\_domain1, MIN = 1, MAX = 1, SVRTYPE=UCS,       |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| ofruisvr SVGNAME = svg\_node1,                                        |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| ofrsmlog SVGNAME = svg\_domain1, MIN = 1, MAX = 1,                    |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| vtammgr SVGNAME = svg\_node1, MIN = 1, MAX = 1, RESTART=NO,           |
| SVRTYPE=UCS,                                                          |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| obmjmsvr SVGNAME = svg\_node1, MIN = 10, MAX = 10,                    |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| obmjschd SVGNAME = svg\_domain1,                                      |
|                                                                       |
| MIN = 1, MAX = 1, SVRTYPE=UCS,                                        |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| obmjinit SVGNAME = svg\_node1,                                        |
|                                                                       |
| MIN = 1, MAX = 1, SVRTYPE=UCS,                                        |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| obmjhist SVGNAME = svg\_domain1,                                      |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| obmjspbk SVGNAME = svg\_domain1, MIN = 1, MAX = 1, SVRTYPE=UCS,       |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| ofrpmsvr SVGNAME = svg\_domain1, MIN = 1, MAX = 1, SVRTYPE=UCS,       |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| obmtsmgr SVGNAME = svg\_domain1, MIN = 1, MAX = 1, SVRTYPE=UCS,       |
|                                                                       |
| CLOPT=\"-o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"               |
|                                                                       |
| OBMJMSVRJDETAIL SVRNAME = obmjmsvr, ROUTING = rt\_nodename            |
|                                                                       |
| OBMJINITCHECK SVRNAME = obmjinit, ROUTING = rt\_nodename              |
|                                                                       |
| OBMJINITCTLNODE SVRNAME = obmjinit, ROUTING = rt\_nodename            |
|                                                                       |
| OBMJINITCTLJOB SVRNAME = obmjinit, ROUTING = rt\_nodename             |
|                                                                       |
| OBMJINITCTLINIT SVRNAME = obmjinit, ROUTING = rt\_nodename            |
|                                                                       |
| OBMJINITRUN SVRNAME = obmjinit, ROUTING = rt\_nodename                |
|                                                                       |
| OBMJINITSTATUS SVRNAME = obmjinit, ROUTING = rt\_nodename             |
|                                                                       |
| OSCOIVP1\_TCL1 SVGNAME= svgbiz,                                       |
|                                                                       |
| TARGET = OSCOIVP1,                                                    |
|                                                                       |
| MIN = 10,                                                             |
|                                                                       |
| MAX = 100,                                                            |
|                                                                       |
| ASQCOUNT = 1,                                                         |
|                                                                       |
| MAXQCOUNT = -1,                                                       |
|                                                                       |
| CLOPT = \"-n -o \$(SVR)\$(DATE).out -e \$(SVR)\$(DATE).err\"          |
+-----------------------------------------------------------------------+

Append the following lines to the end of \$TMAXDIR/config/oframe.m.

+----------------------------------------------------------------------+
| \*ROUTING                                                            |
|                                                                      |
| rt\_nodename FIELD = \"FIELD/FB\_NODENAME\",                         |
|                                                                      |
| RANGES = \"\'NODE1\':svg\_node1,\'NODE2\':svg\_node2,\*:svg\_node1\" |
+----------------------------------------------------------------------+

**\
**

**CREATE OPENFRAME DIRECTORY (NODE2)**

+----+--------------------------------------------+
| \$ | mkdir /opt/tmaxapp/OpenFrame               |
|    |                                            |
| \$ | chown -R oframe:mqm /opt/tmaxapp/OpenFrame |
+----+--------------------------------------------+

**COPYING OPENFRAME DIRECTORY TO NODE2 (NODE1)**

By using the SCP command, copy OpenFrame-related directories to Node 2.

  ---- -----------------------------------------------------------------------------
  \$   scp -r -P 22 \$OPENFRAME\_HOME/\* oframe\@tmaxaws2:/opt/tmaxapp/OpenFrame/.
  ---- -----------------------------------------------------------------------------

**TJES CONFIGURATION (NODE2)**

Add the following option to \$OPENFARME\_HOME/config/tjes.conf.

+-------------------------+
| \[NODEINFO\]            |
|                         |
| \# DOMAINNAME=DOM1      |
|                         |
| \# DOMAINLIST=DOM1;DOM2 |
|                         |
| NODENAME=NODE2          |
|                         |
| NODELIST=NODE1;NODE2    |
+-------------------------+

**SHELL PROFILE CONFIGURATION (NODE1, NODE2)**

Add the following lines to .bash\_profile.

+-----------------------------------------------------------------------+
| \#\#\#\#\#\#\#\#\#\# RACD SETTING                                     |
| \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#          |
|                                                                       |
| export TMAX\_RAC\_PORT=5100                                           |
|                                                                       |
| export TMAX\_RAC\_IPV6=5100                                           |
+-----------------------------------------------------------------------+

**\
**

**3-4. JEUS CONFIGURATION**

Connect to the login page of JEUS WebAdmin. (e.g,
174.129.59.193:9736/webadmin/login)

Go to main screen, and click Resources -\> Data Source -\> Database's
DataSource ID.

Advanced Options in the database section, fill the property as below.

![](media/image37.png){width="5.760416666666667in"
height="3.0520833333333335in"}

It consists of two lines so that JEUS can detect both TAC1 and TAC2
servers. Check the TAC1 and TAC2's IP addresses and ports.

+-----------------------------------------------------------------------+
| driverType:java.lang.String=thin                                      |
|                                                                       |
| URL:java.lang.String=jdbc:tibero:thin:@(DESCRIPTION=(LOAD\_BALANCE=ON |
| )(FAILOVER=ON)                                                        |
|                                                                       |
| (DATABASE\_NAME=TVSAM)(ADDRESS\_LIST=(ADDRESS=(HOST=172.31.60.2)(PORT |
| =8629))                                                               |
|                                                                       |
| (ADDRESS=(HOST=172.31.52.251)(PORT=8629))))                           |
+-----------------------------------------------------------------------+

Process Startup and Termination 
--------------------------------

**4-1. OPENFRAME OSC/TJES ENGINE BOOT (NODE 1, NODE2)**

+----+------------------------------------------------------------+
| \$ | racd -k 5100 \# RACD Process (Only runs unless RACD is up) |
|    |                                                            |
| \$ | oscboot -N NODE1                                           |
|    |                                                            |
| \$ | oscboot -N NODE2 -C                                        |
|    |                                                            |
| \$ | tjesmgr BOOT NODE=NODE1                                    |
|    |                                                            |
| \$ | tjesmgr BOOT NODE=NODE2                                    |
+----+------------------------------------------------------------+

**4-2. OPENFRAME OSC/TJES ENGINE TERMINATION (NODE1, NODE2)**

+-----------------------------------+-----------------------------------+
| \$                                | ps -ef \| grep racd \| grep -v    |
|                                   | grep \| awk \'{print \$2}\' \|    |
| \$                                | xargs kill -9 \# Not always       |
|                                   | necessary                         |
|                                   |                                   |
|                                   | oscdown                           |
+-----------------------------------+-----------------------------------+

**4-3. TIBERO INSTANCE BOOT**

**TAC1**

  ---- ---------
  \$   tbcm -b
  ---- ---------

**TAC2**

  ---- ---------
  \$   tbcm -b
  ---- ---------

**TAC1**

  ---- --------
  \$   tbboot
  ---- --------

**TAC2**

  ---- --------
  \$   tbboot
  ---- --------

**4-3. TIBERO INSTANCE DOWN**

**TAC1**

  ---- --------
  \$   tbdown
  ---- --------

**TAC2**

  ---- --------
  \$   tbdown
  ---- --------

**TAC1**

  ---- ---------
  \$   tbcm -d
  ---- ---------

**TAC2**

  ---- ---------
  \$   tbcm -d
  ---- ---------

**4-4. TIBERO TAC STATUS CHECK**

  ---- ---------
  \$   tbcm -s
  ---- ---------

Appendix A.
===========

List of default ports in OFrame: 
---------------------------------

**[Application side]{.underline}**

> TMAX - 3948
>
> VTAM - 5667
>
> JEUS - 9736
>
> OFGW - 8078
>
> OFAdmin - 8088
>
> OFMiner - 8098

**[Database side]{.underline}**

> Tibero - 8629

These port number can be changeable by installer or property files but
they must be kept in mind during entire installation process.

unixODBC configuration to Tdibero in Remote Sever with IP address
-----------------------------------------------------------------

> **odbc.ini**
>
> \[ODBC Data Sources\]
>
> tibero6 = Tibero6 ODBC driver
>
> \[TVSAM\]
>
> Driver = /opt/tmaxdb/tibero6/client/lib/libtbodbc.so
>
> Description = Tibero ODBC driver for Tibero6
>
> SERVER = IP Address
>
> PORT = 8629
>
> DATABASE = TVSAM
>
> ~~DSN = TVSAM~~
>
> ~~SID = TVSAM~~
>
> User = tibero
>
> Password = tmax

DB creation script for customized data file location
----------------------------------------------------

> create database \"TVSAM\"
>
> user sys identified by tibero
>
> maxinstances 8
>
> maxdatafiles 1000
>
> character set MSWIN949
>
> national character set UTF16
>
> logfile
>
> group 1
> (\'/tvsam/v1/redo1/log001a.log\',\'/tvsam/v2/redo2/log001b.log\') size
> 1000M,
>
> group 2
> (\'/tvsam/v1/redo1/log002a.log\',\'/tvsam/v2/redo2/log002b.log\') size
> 1000M,
>
> group 3
> (\'/tvsam/v1/redo1/log003a.log\',\'/tvsam/v2/redo2/log003b.log\') size
> 1000M
>
> maxloggroups 255
>
> maxlogmembers 8
>
> noarchivelog
>
> datafile \'/tvsam/data1/system001.dtf\' size 2000M autoextend on next
> 500M maxsize unlimited
>
> default temporary tablespace TEMP
>
> tempfile \'/tvsam/v1/temp1/temp001.dtf\' size 5000M autoextend on next
> 500M maxsize 10000M,
>
> \'/tvsam/v1/temp1/temp002.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v1/temp1/temp003.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v1/temp1/temp004.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v1/temp1/temp005.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v1/temp1/temp006.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v1/temp1/temp007.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v1/temp1/temp008.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v1/temp1/temp009.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v1/temp1/temp010.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp011.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp012.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp013.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp014.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp015.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp016.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp017.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp018.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp019.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M,
>
> \'/tvsam/v2/temp2/temp020.dtf\' size 5000M autoextend on next 500M
> maxsize 10000M
>
> extent management local autoallocate
>
> undo tablespace UNDO datafile \'/tvsam/data1/undo001.dtf\' size 2000M
> autoextend on next 500M maxsize 10000M,
>
> \'/tvsam/data1/undo002.dtf\' size 2000M autoextend on next 500M
> maxsize unlimited
>
> extent management local autoallocate;

-   if log file groups contain multiple file in each group, they must be
    indicated (enumerated) in parenthesis "( )".

> create tablespace \"DEFVOL\" datafile \'/tvsam/data1/DEFVOL.dtf\' size
> 3000M autoextend on;
>
> create tablespace \"TACF00\" datafile \'/tvsam/data1/TACF00.dtf\' size
> 1000M autoextend on;

 Appendix B
==========

OFMiner -- Updating and Refreshing Tables
-----------------------------------------

### Updating/Reinstalling OFMiner

**[Steps:]{.underline}**

1.  Create a backup of your repository if you have not already

    **0a.)** cd \$OFMINER\_HOME/repository

    cp -r . /backup/location

**1.)** Ensure JEUS is up

**1a.)** Go to the JEUS URL: \<IP\_Address\>:9736/webadmin/login (For
Sears POC: 34.202.43.134:9736/webadmin/login) If the webpage loads, JEUS
is up.

**1b.)** Alternatively, you can use the jps command which will show you
the PIDs of the running servers

![](media/image38.png){width="3.0305555555555554in"
height="0.6993055555555555in"}

**2.)** Undeploy OFMiner

**2a.)** Login to JEUS with a web browser
\<IP\_Address\>:9736/webadmin/login

Default\_ID: administrator

Default\_Password: tmax1234

![](media/image39.png){width="6.747222222222222in"
height="3.1152777777777776in"} **2b.)** Click on "Applications" then
check the Application you want to undeploy (ofminer" and click the
"undeploy" button

**2c.)** You will be prompted, just click "OK"

![](media/image40.png){width="3.373611111111111in"
height="3.0284722222222222in"}

![](media/image41.png){width="6.8125in" height="0.4708333333333333in"}
**2d.)** If Undeployment was successful, you should receive this message
above the Applications

**3.)** Uninstall OFMiner

**3a.)** Change directory to "\$OFMINER\_HOME/UninstallerData"

![](media/image42.png){width="5.164583333333334in"
height="1.5326388888888889in"}

**3b.)** Execute the "Uninstall\_OFMiner" script

![](media/image43.png){width="6.1222430008748905in"
height="5.553080708661417in"}

![](media/image44.png){width="6.8125in" height="4.2652777777777775in"}

**4.)** Install New Binaries

**4a.)** Copy new binaries to /opt/tmaxsw or common directory

**4b.)** Make sure your binaries are executable: chmod a+x
OFMiner7\_0\_Generic.bin

**4c.)** Execute the Binary

Below are the keystrokes to be entered during OFMiner Installation

**./OFMiner7\_0\_Generic.bin**

**\<Enter\>**

**\<Enter\>**

**\<Enter\>**

**Y**

**/opt/tmaxui/ofminer**

**Y**

**\<Enter\>**

**ofminer\_svr**

**tmax1234**

**9736**

**\<Enter\>**

**\<Enter\>**

**\<Enter\>**

**\*\*CONTINUED ON NEXT PAGE\*\***

**\<Enter\>**

**\<Enter\>**

**\<Enter\>**

**/opt/tmaxui/ofminer/license/OFMinerLicense**

**\<Enter\>**

You should receive the following message in the Standard Output when you
have successfully Installed OFMiner

![](media/image45.png){width="6.8125in" height="3.3020833333333335in"}
