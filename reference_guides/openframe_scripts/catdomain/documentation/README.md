# How to use catdomain.sh

catdomain is a simple script which reads the xml file created during Jeus installation to find the servers noted in the script. The script contains a check for the following servers:

- DomainAdminServer
- ofminer
- ofmanager
- ofgw

```bash
usage: sh catdomain.sh
```

To set the script up properly, you may need to change lines 9-25 to match the server names and application names given during the time of installation.