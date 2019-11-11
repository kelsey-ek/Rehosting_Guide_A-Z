# How to use catdomain.sh

## Description

catdomain is a simple script which reads the xml file created during Jeus installation to find the servers noted in the script. The script contains a check for the following servers:

- DomainAdminServer
- ofminer
- ofmanager
- ofgw

Once you execute the script, you will be able to copy and paste the URL directly into a web browser to navigate to the desired application.

## Setup

To set the script up properly, you may need to change lines 9-25 to match the server names and application names given during the time of installation.

## Usage

```bash
usage: sh catdomain.sh
```

## Link to Source

You can find the source code here: [Link to Source](../source/catdomain.sh)