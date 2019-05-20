# **How to Compile MFS Resources**

_The purpose of this document is to describe how to properly compile and update MFS (Message Format Service) resources on OpenFrame. The steps that will be provided in this guide include compilation through osimfsgen, copying the machine code - compiled MFS to the inactive library using dfsuocu0, and preparing/commiting the changes using the IMS commands._

##**Staging PDS and Active/Inactive PDS**

In an IMS system, the MFS (Message Format Service) resources have a staging PDS and an active/inactive PDS. The purpose of this structure is to be able to dynamically allocate new MFS resources and updates to existing MFS resources without having to bring the online regions down. 

##**Steps**
	
	1. Compile the MFS using osimfsgen

		osimfsgen (From OpenFrame_Common_7_Fix#3_Tool_Reference_Guide_v2.1.5_en.pdf)

			Creates 4 types (MID, MOD, DIF, and DOF) of binary files by compiling MFS files to machine language code.

			Chapter 8. OpenFrame/OSI System Tools 241

Usage

	`Usage: osimfsgen [options1] <file>
	| osimfsgen [options2] <dir> <file>
	| osimfsgen [options3] <FMTLIB> <file>`

- [options1]

Option Description

[-d] Shows the MFS file to compile.

[-p 1] Previews the emulator screen in the 1 byte character format.

[-p 2] Previews the emulator screen in the 2 byte character format.

[-l] Displays the process of preprocessing source to compile.

[-h] Shows help information.

- [options2]

Option Description

[-o] Directory in which the binary file is created.

- [options3]

Option Description

[-m] FMTLIB data set for specific region.

- Input parameters

Parameter Description

<file> Name of MFS format file to compile.

<dir> Directory in which the binary file is created.

<FMTLIB> FMTLIB data set.

Examples

The following compiles the OIVP001.TXT file and saves in FMTLIB

(OPNFRAME.ONLINE.MFDLIB) of IMSA.

$ osimfsgen -m OPNFRAME.ONLINE.MFDLIB OIVP001.TXT

osimfsgen 7.1.0(54) obuild@tplinux64:ofsrc7/osi(#1) 2018-02-10 17:45:12


