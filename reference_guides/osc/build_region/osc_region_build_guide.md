# OSC Region Build Guide

Follow this guide to build a new OSC Region.

## Table of Contents

1. [Check Resources of SD Macro File](#Check-the-resources-of-the-region-from-the-sd-macro-file)
2. [Build the region and configure it in TMAX configuration](#build-the-region-and-configure-it-in-tmax-configuration)
3. 

## Steps

**Firstly:** Customer should provide a System Definition (SD) Macro File for each region.

### Check the Resources of the Region from the SD Macro File

1. Check which tranclasses are used for each region.

```
DEFINE TRANCLASS(**transaction_id**)
	   GROUP(resourcegroup_name)
	   MAXACTIVE(number)
	   PURGETHRESH(NO | number)
```

2. Check which group lists are used for each region.

```
ADD GROUP (resourcegroup_name01) LIST(grouplist)
ADD GROUP (resourcegroup_name02) LIST(grouplist)
ADD GROUP (resourcegroup_name03) LIST(grouplist)
```

### Build the region and configure it in TMAX configuration

1. Build the region with oscbuild tool. (Options may vary)

```bash
oscbuild -o LINUX64 -d TIBERO -s region_name -b OFCOBOL
```

Above, _LINUX64_ describes the Operating System Architecture, _TIBERO_ describes the Database, _region\_name_ describes the name of the OSC region we are trying to build, and _OFCOBOL_ describes the type of COBOL Compiler you are using.

You can issue ```oscbuild``` command without any parameters to see the usage.

2. Deploy the region server module to APPDIR directory. (from oframe.m)


#TODO

