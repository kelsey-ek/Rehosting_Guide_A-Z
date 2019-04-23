# **How to Apply OpenFrame and Tibero Patches**

**Table of Contents**
=================================================================

[**General Patch Notes** 1](#general-patch-notes)

[**Tibero** 2](#tibero)

[**OFMiner** 3](#ofminer)

[**OFManager** 4](#ofmanager)

[**OFCOBOL** 4](#ofcobol)

[**PROSORT** 5](#prosort)

[**OFASM** 5](#ofasm)

[**OFPLI** 6](#ofpli)

[**TMAX** 6](#tmax)

[**OpenFrame Base** 6](#openframe-base)

[**OpenFrame HIDB** 7](#openframe-hidb)

[**OpenFrame** **OSI** 7](#openframe-osi)

[**OpenFrame TACF** 7](#openframe-tacf)

[**JEUS** 7](#jeus)

**General Patch Notes**
=======================

Patch Directories are generally created as such

-   PATCH

-   Product - TIBERO

-   Identifier - 123456

-   Unpacked Files / Directories - tibero6

-   Identifier - 987654

-   Unpacked Files / Directories - tibero6

The general concept of applying patches in OpenFrame:

-   Receive the patch in a compressed form

-   Bring the product down

-   Unpack the patch

-   Create a new directory for the patch

-   Unlink the old patch

-   Link to the new patch

-   Copy old files like properties and licenses to the new patch
    directory

-   Run any scripts required for the product

-   Boot the product

**Tibero**
==========

To apply Tibero patch, OpenFrame must be downed.

1.  jdown -- Bring Jeus and web applications down.

2.  osidown.sh -- Bring OpenFrame online down.

3.  osidown -- Bring OpenFrame down

4.  tbdown -- Bring Tibero down

5.  Copy the patch to the patch Directory as described in the General
    Patch Notes

6.  Untar the patch file

7.  Backup the old Tibero directory by changing the name of the
    directory

8.  Create a symbolic link to the new patch

    a.  Unlink the old tibero directory

> *cd /opt/tmaxdb*
>
> *unlink tibero6*
>
> *ln -s
> \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/tibero6
> tibero6*

9.  Change directory to the config directory inside the new tibero6
    folder

10. Run the gen\_tip.sh script

> *sh gen\_tip.sh*

11. Copy the old .tip file to the new tibero6/config folder.

> *cp \${tibero6\_Backup\_Directory}/config/TVSAM.tip
> \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/tibero6/config*

12. Copy the old tibero6 license to the license directory

> *cp \${tibero6\_Backup\_Directory}/license/license.xml
> \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/tibero6/license/*

13. Copy the old instance folder to the new tibero6 directory

> *cp -r \${tibero6\_Backup\_Directory}/instance
> \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/tibero6/*

14. Copy the database directory from the old directory

    *cp -r \${tibero6\_Backup\_Directory}/database
    \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/tibero6/*

15. Run the system.sh script in tibero6/scripts

    *sh system.sh*

*SYS password -- tibero*

*SYSCAT password -- syscat*

16. Give the response "NO" without the quotes, for any prompts

17. Check the current patch version of tibero6

    *tbboot -v*

18. When you bring the tbsvr down, there's still shared memory, so you
    can clear it by using the ipcrm command

    *ipcrm -m \<shmid\>*

19. Boot Tibero6

    *Tbboot*

**OFMiner**
===========

To apply OFMiner patch, begin by bringing the OFMiner server down.

1.  Bring OFMiner down

    *jdown 2*

2.  Create a new OFMiner directory inside the patch directory

    *cd \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}*

    *mkdir OFMiner*

3.  Create a backup of the old OFMiner by changing the name of the
    directory

    *mv OFMiner OFMiner\_Backup\_Date*

4.  Unlink the old OFMiner directory

    *cd /opt/tmaxui*

    *unlink OFMiner*

5.  Create a new symbolic link to the new OFMiner Directory

    *cd /opt/tmaxui*

    *ln -s
    \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORYT}/\${IDENTIFIER}/OFMiner
    OFMiner*

6.  Download the patch and move it into the new OFMiner directory
    created in step 2

    *mv PATCHFILE.war
    \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/OFMiner*

7.  Unpack the patch file

    *Jar -xvf PATCHFILE.war*

8.  Copy the old license to the new OFMiner directory

    *cp \${OFMiner\_Backup\_Directory}/license/OFMinerLicense
    \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/OFMiner/license/*

9.  Copy all old properties file to the new OFMiner directory

    *cp -r \${OFMiner\_Backup\_Directory}/properties
    \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/OFMiner/*

10. Run the new OFMiner scripts. This creates new tables that are stored
    in the Database Tibero

    *tbsql tibero/tmax \@DROP.sql*

    *tbsql tibero/tmax \@CREATE.sql*

    *tbsql tibero/tmax \@INSERT.sql*

11. Boot OFMiner

    *jboot 2*

**OFManager**
=============

To apply OFManager patch, begin by bringing down the OFManager server

1.  Bring OFManager down

    *jdown 3*

2.  Download the patch file

3.  Unzip the file

    *Unzip PATCHFILE.zip*

4.  You should receive two folders at least (WEB-INF and resources)

5.  Unlink the current WEB-INF and resources folders in the
    \$OFMANAGER\_HOME directory

    *unlink WEB-INF*

    *unlink resources*

6.  Link the new WEB-INF and resources folders to the \$OFMANAGER\_HOME
    directory

    *cd /opt/tmaxui/ofmanager*

    *ln -s
    \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/WEB-INF
    WEB-INF*

    *ln -s
    \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/resources
    resources*

7.  Inside of the WEB-INF folder, there's a folder called classes.
    Inside the classes folder, there's a file called logback.xml. We
    need to copy this file from the previous patch to the current one.

    *cp
    \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/ofmanager\_backup/WEB-INF/classes/logback.xml
    \$OFMANGER\_HOME/WEB-INF/classes/*

8.  Bring OFManager back up

    *jboot 3*

**OFCOBOL**
===========

OFCOBOL patches generally come in the form of entire directories

1.  Unlink the current OFCOBOL link

    *cd /opt/tmaxapp*

    *unlink OFCOBOL*

2.  Download the patch to the
    \${PATCH\_DIRECTORY}/\${PRODUCT}/\${IDENTIFIER}

3.  Unpack the patch file

    *tar -xzvf PATCH\_FILE.tar.gz*

4.  Create a new symbolic link for OFCOBOL to the new patch directory

    *cd /opt/tmaxapp*

    *ln -s \${PATCH\_DIRECTORY}/\${PRODUCT}/\${IDENTIFIER}/OFCOBOL
    OFCOBOL*

5.  Copy the old license directory to the new patch directory

    *cp -r \${OFCOBOL\_BACKUP}/license /opt/tmaxapp/OFCOBOL/*

6.  Check the current version to ensure that the patch was successful

    *ofcob --version*

**PROSORT**
===========

Prosort patches also generally come in the form of entire directories
but may also include some library files.

1.  Unlink the current Prosort link

    *cd /opt/tmaxapp*

    *unlink prosort*

2.  Download the patch to the
    \${PATCH\_DIRECTORY}/\${PRODUCT}/\${IDENTIFIER}

3.  Unpack the patch file

    *tar -xzvf PATCHFILE.tar.gz*

4.  Create a new symbolic link for prosort to the new patch directory

    *cd /opt/tmaxapp*

    *ln -s \${PATCH\_DIRECTORY}/\${PRODUCT}/\${IDENTIFIER}/prosort
    prosort*

5.  Copy the old license directory to the new patch directory

    *cp -r \${prosort\_backup}/license /opt/tmaxapp/prosort/*

6.  Check the current version to ensure that the patch was successful

    *prosort -v*

As described previously, it's possible that the patch requires some
library files. Patching library files is very simple using the
ofpatch.sh shell script.

1.  After unpacking the patch file, you may find a library file. To
    patch it, simply run the shell script ofpatch.sh and specify the IMS
    ticket number associated with the patch.

    *tar -xzvf \<PATCHFILE.tar.gz\>*

    *ofpatch.sh - n \<IMS\_Ticket\_number\> \${Library\_File}*

**OFASM**
=========

OpenFrame Assembler (OFASM) patches also generally come in the form of
entire directories

1.  Unlink the current OFASM link

    *cd /opt/tmaxapp*

    *unlink OFASM*

2.  Download the patch to the
    \${PATCH\_DIRECTORY}/\${PRODUCT}/\${IDENTIFIER}

3.  Unpack the patch file

    *tar -xzvf PATCHFILE.tar.gz*

4.  Create a new symbolic link for OFASM to the new patch directory

    *cd /opt/tmaxapp*

    *ln -s \${PATCH\_DIRECTORY}/\${PRODUCT}/\${IDENTIFIER}/OFASM OFASM*

5.  Check the current version to ensure that the patch was successful

    *ofasm \--version*

**OFPLI**
=========

OpenFrame PL/I (OFPLI) patches also generally come in the form of entire
directories

1.  Unlink the current OFPLI link

    *cd /opt/tmaxapp*

    *unlink OFPLI*

2.  Download the patch to the
    \${PATCH\_DIRECTORY}/\${PRODUCT}/\${IDENTIFIER}

3.  Unpack the patch file

    *tar -xzvf PATCHFILE.tar.gz*

4.  Create a new symbolic link for OFPLI to the new patch directory

    *cd /opt/tmaxapp*

    *ln -s \${PATCH\_DIRECTORY}/\${PRODUCT}/\${IDENTIFIER}/OFPLI OFPLI*

5.  Copy the old license directory to the new patch directory

    *cp -r \${OFPLI\_Backup}/license /opt/tmaxapp/OFPLI/*

6.  Check the current version to ensure that the patch was successful

    *ofpli \--version*

**TMAX**
========

OpenFrame Core (TMAX) patches often come in the form of library files.
Once unpacked, they can be patched similar to any other library files --
ofpatch.sh

1.  After unpacking the patch file, you may find a library file. To
    patch it, simply run the shell script ofpatch.sh and specify the IMS
    ticket number associated with the patch.

    *tar -xzvf \<PATCHFILE.tar.gz\>*

    *ofpatch.sh - n \<IMS\_Ticket\_number\> \${Library\_File}*

    Alternatively, you can manually copy the library files directly to
    \$OPENFRAME\_HOME/core/lib but it is HIGHLY recommended that you
    take backups of the current library files first.

**OpenFrame Base**
==================

OpenFrame Base patches generally come in the form of library files and
binary files. Similar to the TMAX patches, ofpatch.sh can be utilized to
patch OpenFrame Base.

1.  After unpacking the patch file, you may find a library file. To
    patch it, simply run the shell script ofpatch.sh and specify the IMS
    ticket number associated with the patch.

    *tar -xzvf \<PATCHFILE.tar.gz\>*

    *ofpatch.sh - n \<IMS\_Ticket\_number\> \${Library\_File}*

    Alternatively, you can manually copy the library files directly to
    \$OPENFRAME\_HOME/core/lib but it is HIGHLY recommended that you
    take backups of the current library files first.

**OpenFrame HIDB**
==================

OpenFrame HIDB patches generally come in the form of library files and
binary files. Similar to the TMAX and OpenFrame Base patches, ofpatch.sh
can be utilized to quickly patch OpenFrame HIDB

1.  After unpacking the patch file, you may find a library file. To
    patch it, simply run the shell script ofpatch.sh and specify the IMS
    ticket number associated with the patch.

    *tar -xzvf \<PATCHFILE.tar.gz\>*

    *ofpatch.sh - n \<IMS\_Ticket\_number\> \${Library\_File}*

After patching OpenFrame HIDB, reloading some HiDB tables may be
necessary

**OpenFrame** **OSI**
=====================

OpenFrame OSI patches generally come in the form of library files.
Similar to the TMAX, OpenFrame Base, and HiDB patches, ofpatch.sh can be
used to quickly patch OpenFrame OSI.

1.  After unpacking the patch file, you may find a library file. To
    patch it, simply run the shell script ofpatch.sh and specify the IMS
    ticket number associated with the patch.

    *tar -xzvf \<PATCHFILE.tar.gz\>*

    *ofpatch.sh - n \<IMS\_Ticket\_number\> \${Library\_File}*

**OpenFrame TACF**
==================

OpenFrame TACF patches generally come in the form of binary files. As
stated previously, ofpatch.sh can be used on binary files as well, so
patching is quick and easy.

1.  After unpacking the patch file, you may find a library file. To
    patch it, simply run the shell script ofpatch.sh and specify the IMS
    ticket number associated with the patch.

    *tar -xzvf \<PATCHFILE.tar.gz\>*

    *ofpatch.sh - n \<IMS\_Ticket\_number\> \${Library\_File}*

**JEUS**
========

Jeus does not require patches often, but at times, the libRunner.so file
may need an update. To apply the patch, unpack the file as normal, and
select the correct file for your operating system. Take a backup of the
previous version and copy the libRunner.so file to the directory
described below

1.  Unpack the tar file

    *tar -xvf \<PATCHFILE.tar\>*

2.  Create a backup of the current libRunner.so file

    *cd \${JEUS\_HOME}/lib/system*

    *cp libRunner.so libRunner.so.DATE\_OF\_BACKUP*

3.  Copy the new libRunner.so file to the system library noted in step 2

    *cd
    \${PATCH\_DIRECTORY}/\${PRODUCT\_DIRECTORY}/\${IDENTIFIER}/\<OPERATING
    SYSTEM\>/*

    *cp libRunner.so \${JEUS\_HOME}/lib/system/*
