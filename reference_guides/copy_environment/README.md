# Copying Environment

When copying an environment by copying a VM, there's a few configuration changes that you need to make. Below are the steps required for copying an environment from a PROD or Test environment with 1 Application Server and 1 Database Server:

## Steps

### Database(Tibero) Server:

1. Create a backup of the tbdsn.tbr file.

	This file can be located in $TB_HOME/client/config

```bash
cp tbdsn.tbr tbdsn.tbr.bk${date}
```

2. Modify the tbdsn.tbr file with the hostname of the new environment

Change the **$(hostname)** to the hostname of the new environment.

```bash
TVSAM=(
	(INSTANCE=(HOST=$(hostname))
		(PORT=8629)
		(DB_NAME=TVSAM)
	)
)
```

3. Replace the old license with the new license

If you don't have the new licenses ready, you can use temporary licenses temporarily which can be downloaded from technet.tmaxsoft.com. Register an account and request demo licenses.

```bash
cd $TB_HOME/license
mv license.xml license.xml.bk${date}
mv ${new_license} license.xml
```

4. Modify the bash profile of the user who installed Tibero.

```bash
vi ~/.bash_profile
```

Modify any references to the old hostname or IP address to the new hsotname or IP address

5. Boot Tibero

First, make sure tibero is down and temporary files cleaned up

```bash
tbdown clean
```

Then boot Tibero

```bash
tbboot
```

6. Verify

Connect to Tibero

```bash
tbsql ${tibero_user}/${tibero_password}
```

Create a test table in the new environment.

```sql
CREATE TABLE TEST(DUMMY VARCHAR (1));
```

 Insert something into the table. Here we are using the letter T to symbolize that it is a TEST environment. In case we are setting up multiple new environments, we would assign a value that would represent each environment. For example:

 - T - Test
 - D - DEV
 - U - UAT
 - P - PROD

```sql
INSERT INTO TEST VALUES ('T');
```

Connect from old server to new server to check the values in the database

```sql
SELECT * FROM TEST;
```

### Application(OpenFrame) Server

1. Make a backup of the old oframe.m file

```bash
cd $OPENFRAME_HOME/core/config
cp oframe.m oframe.m.bk${date}
```

2. Modify the oframe.m file

Find all references of the old hostname or IP Address, and change them to the new hostname or IP Address

```bash
vi $OPENFRAME_HOME/core/config/oframe.m
```

3. Modify the ODBC Settings.

Find all references of the old hostname or IP Address, and change them to the new hostname or IP Address

```bash
cd $ODBC_HOME/etc
vi odbc.ini
vi odbcinst.ini
```

4. Verify

Use tbsql to connect to the new database

```bash
tbsql ${tibero_user}/${tibero_password}
```