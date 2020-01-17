# Initiator Configuration

The initiator configuration of OpenFrame can be matched to that of the mainframe. To retrieve the initiator configuration from the mainframe, someone with permissions to submit jobs on the mainframe can use the below JCL:


```JCL
//SDSF001  JOB (N,FCQMVS),'APP001',
//         CLASS=A,MSGCLASS=5,NOTIFY=USER1
//SDSF  EXEC PGM=SDSF
//ISFOUT DD SYSOUT=*
//CMDOUT DD DSN=USER1.TSO.SDSF.OUTPUT,
//          DISP=(,CATLG,DELETE),
//          DCB=(RECFM=FBA,LRECL=133,BLKSIZE=0),
//          SPACE=(CYL,(1,1)),UNIT=SYSDA
//ISFIN  DD *
  SET CONSOLE BATCH
  SET DELAY 600
  /$ DI
  PRINT FILE CMDOUT
  ULOG
  PRINT
  PRINT CLOSE
/*
//
```

**Note**: Some minor parsing may be required after running this JCL