       IDENTIFICATION                           DIVISION.
      ****************************************************************
       PROGRAM-ID.                              COB1.
       AUTHOR.                                  TMAX.
       INSTALLATION.                            TMAX.
       DATE-WRITTEN.                     2013-06-17-11-50.50.000000
       SECURITY.             
      ****************************************************************
       ENVIRONMENT                              DIVISION.
      ****************************************************************
      *===============================================================
       CONFIGURATION                            SECTION.
      *===============================================================
       SOURCE-COMPUTER.                         IBM.
       OBJECT-COMPUTER.                         IBM.
      *
      ****************************************************************
       INPUT-OUTPUT                             SECTION.
      *---------------------------------------------------------------
       FILE-CONTROL.
            SELECT OUT-FILE   ASSIGN        TO  OFILE1
                              ORGANIZATION  IS  SEQUENTIAL
                              FILE STATUS   IS  WK-OUTDD-STATUS.
      *===============================================================
       DATA                                     DIVISION.
      *===============================================================

      *---------------------------------------------------------------
       FILE                                     SECTION.
      *---------------------------------------------------------------
       FD    OUT-FILE          
                             LABEL     RECORD   IS   STANDARD
                             RECORDING MODE     F                
                             BLOCK     CONTAINS 0    RECORDS.
       01    OUT-REC.
       COPY  COPY1.

      *===============================================================
       WORKING-STORAGE                          SECTION.
       01    WK-OUTDD-STATUS                    PIC  X(002).

      *===============================================================
      *  PROGRAM   ROUTINE
      *---------------------------------------------------------------
       PROCEDURE                                DIVISION.
      *---------------------------------------------------------------
           CALL    'COB2'.
           OPEN    OUTPUT                       OUT-FILE.

           MOVE    'COB1' TO OUT-REC.
           WRITE   OUT-REC. 
           CLOSE   OUT-FILE. 
           CALL    'COB3'.

           GOBACK.
