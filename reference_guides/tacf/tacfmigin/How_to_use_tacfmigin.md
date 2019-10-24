# How to Use tacfmigin

tacfmigin is a compiled C program. It takes in a RACF dump as input and outputs a file called script.out. script.out can be divided into different TACF commands using simple linux commands such as grep, this process will be explained below.

### Variables
RACF_DUMP_MF        : This variable describes the name of the RACF Dump provided from the customer.

tacfmigin_folder    : This variable describes the path to the tacfmigin directory created in step 2.

TACF_ROOT_PASSWORD  : TACF Root User's Password

## Steps

1. Receive a RACF dump from the customer

The engineers involved in migrating RACF definitions to TACF must request a dump from the customer as a text file.

2. Create a directory structure to house all tacfmigin related assets

```bash
cd $OPENFRAME_HOME/..
mkdir tacfmigin
```

Copy list.h, tacfmigin, and the RACF dump file to the tacfmigin directory

3. Rename the RACF dump file to RACF_DUMP.txt

```bash
mv $RACF_DUMP_MF ${tacfmigin_folder}/RACF_DUMP.txt
```

4. Execute tacfmigin

```bash
./tacfmigin
```

5. After executing tacfmigin, a script.out file is created as output. Split the script.out file generated from tacfmigin into 6 files using the following commands:

```bash
grep ^ADDGROUP script.out > ADDGROUP.scr; echo QUIT >> ADDGROUP.scr
grep ^ADDUSER script.out > ADDUSER.scr; echo QUIT >> ADDUSER.scr
grep ^CONNECT script.out > CONNECT.scr; echo QUIT >> CONNECT.scr
grep ^ADDSD script.out > ADDSD.scr; echo QUIT >> ADDSD.scr
grep ^RDEFINE script.out > RDEFINE.scr; echo QUIT >> RDEFINE.scr
grep ^PERMIT script.out > PERMIT.scr; echo QUIT >> PERMIT.scr
```
**Note**: In the ADDUSER.scr, you need to double-triple check that there are no single quotes in the names... If there are switch them to double quotes. 

Example:

```
BEFORE:
ADDUSER ('USER123') ... NAME('LASTNAME/FIRSTNAME'') ...

AFTER:
=> ADDUSER ('USER123') ... NAME("LASTNAME/FIRSTNAME") ...
```

6. Once the 6 scripts are created, run the ADDGROUP.scr and ADDUSER.scr multiple times.

The reasoning for this is because of the dependant nature of adding users and groups. The RACF Dump doesn't necessarily dump the RACF definitions in the order of dependencies so you'll often run into situations where a group is not yet defined, but a user belongs to that group. This will result in an error. To resolve this, if we run both of these scripts about 20 times, we can almost guarantee that we will add all groups and users.

Here is the command you can use:

```bash
$ for x in `seq 20`; 
   do tacfmgr -iROOT/${TACF_ROOT_PASSWORD} < ADDGROUP.scr;
   tacfmgr -iROOT/${TACF_ROOT_PASSWORD} < ADDUSER.scr; 
done
```

**Note**: During execution, you may see errors like (-18902, -17210), but you can ignore them. The reason you will see these errors is because they are duplicate names and groups, but this is expected because we are running the script 20 times.

7. Run the CONNECT.scr, ADDSD.scr, and RDEFINE.scr
 
```
tacfmgr -iROOT/${TACF_ROOT_PASSWORD} < CONNECT.scr
tacfmgr -iROOT/${TACF_ROOT_PASSWORD} < ADDSD.scr
tacfmgr -iROOT/${TACF_ROOT_PASSWORD} < RDEFINE.scr
```

8. Change the RDEFINE commands to RALTER and run RALTER.scr

	1.

		```bash
		sed "s/^RDEFINE/RALTER/" RDEFINE.scr > RALTER.scr
		```
	2.

		```
		tacfmgr -iROOT/${TACF_ROOT_PASSWORD} < RALTER.scr
		```

9. Run PERMIT.scr

```
tacfmgr -iROOT/${TACF_ROOT_PASSWORD} < PERMIT.scr
```
