# How to Create an OFMiner Report

_The purpose of this guide is to describe the steps needed to create a report that identifies the scope of the project based on the JCL. To create this guide, the customer must first identify which JCLs are currently being used in production. The list of JCLs must be sent to the rehosting team, and then the source code transfer should begin. Upon transfer of all source code, the in-scope JCLs can be added to the OFMiner repository to be analyzed_

**Prerequisites:**
	
	- Source Code Transfer - Complete
	- Installation - Complete

**Description:** OFMiner uses a directory structure in $OFMINER_HOME to sort the in-scope elements. The analysis will start with the JCLs and work it's way all the way down to the Copybooks. The steps for completing this will be highlighted below. The directory structure looks like the following:
	
	```
	- $OFMINER_HOME/repository
		- JCL
		- PROC
		- COBOL
		- COPYBOOK
		- CSD
	```

## Steps

_Find the shortened version of the steps below this section_

1. Receive a list of in-scope JCL's from the customer

**Description:** The customer defines what is in scope and what is not. OFMiner is simply a tool to help you determine what elements need to be rehosted to satisfy the requirements of the scope. 

2. Create a PDS (or multiple) for the in-scope JCL

**Description:** For OFMiner analysis, you don't need to go through pdsgen or dscreate to create a PDS. Simply make a directory using Linux commands **mkdir**.  

```
cd $OFMINER_HOME/repository/JCL
mkdir CUSTOMER.JCLLIB
```

3. Copy all of the in-scope JCL to the newly created JCLLIB

**Description:** Once all of the JCL has been moved to $OFMINER_HOME/repository/JCL/CUSTOMER.JCLLIB, OFMiner can then detect the JCL and analyze it.

4. Sync OFMiner

**Description:** For OFMiner to be able to detect the JCLs, you have to SYNC the repository with the OFMiner application. Please refer to the image "Edit-OFMiner SYNC". In general, whenever you add new source code to the repository, you need to SYNC for it to show up in OFMiner. 

5. Analyze the JCL

**Description:** Now that the JCL is SYNC'd into OFMiner, you can analyze the JCL to parse the JCL. The parsing process includes:
	
	- Syntax Checking
	- Procedure Discovery
	- Program Discovery
	- Utility Discovery
	- Dataset Discovery

6. Create a PDS (or multiple) for the in-scope PROCs

**Description:** Now that you have analyzed the JCL, you're most likely missing a few Procedures (PROCs). This is how we determine what is in scope and what isn't. Similar to steps 2-5, you need to create a PDS for the in-scope PROCs and sync so OFMiner can detect them. Additionally, you are most likely noticing that all of the programs executed in the JCL and in the PROCs are noted as missing. We will address this in the following steps.

7. Create a PDS (or multiple) for the in-scope COBOL programs

**Description:** Again, exactly like step 6 and step 2, you need to create a PDS for the in-scope COBOL programs. Follow the steps below:

```
cd $OFMINER_HOME/repository/COBOL
mkdir CUSTOMER.COBLIB
```

Once you've created the CUSTOMER.COBLIB, move all the "Missing COBOL" to the COBLIB, SYNC, and analyze.

8. Repeat steps 2-7 until you no longer have any missing source.

**Description:** In most cases, you will always have some missing source because customer's sometimes lose the source and only have the compiled load modules, but this gives us the opportunity to identify and address these. 



