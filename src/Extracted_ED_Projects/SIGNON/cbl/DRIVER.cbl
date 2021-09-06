000100*****************************************************************
000200*                                                               *
000300*   Copyright (C) 1998-2021 Micro Focus. All Rights Reserved.   *
000400*   This demonstration program is provided for use by users     *
000500*   of Micro Focus products and may be used, modified and       *
000600*   distributed as part of your application provided that       *
000700*   you properly acknowledge the copyright of Micro Focus       *
000800*   in this material.                                           *
000900*                                                               *
001000*****************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DRIVER.

       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 BRE-OUT-OUTPUT-STRUCTURE2.
           02 BRE-O-WS-INPUT-FLAG PIC X(1).
           02 BRE-0-WS-ERROR-MSG PIC X(75).
           02 BRE-BANK-SIGNON-ID PIC X(5).
           02 BRE-BANK-USERID PIC X(5).
           02 BRE-BANK-USERID-NA PIC X(25).

       LINKAGE SECTION.

       COPY 'REQUEST'.
       COPY 'RESPONSE'.

       PROCEDURE DIVISION.
       000-START-PROCESSING.

           SET ADDRESS OF BRE-INP-INPUT-STRUCTURE
              TO ADDRESS OF DFHCOMMAREA
           
           CALL 'UserVal' USING DFHEIBLK
                                DFHCOMMAREA
                                BRE-INP-INPUT-STRUCTURE
                                BRE-OUT-OUTPUT-STRUCTURE2 

           SET ADDRESS OF BRE-OUT-OUTPUT-STRUCTURE
              TO ADDRESS OF DFHCOMMAREA

           MOVE BRE-OUT-OUTPUT-STRUCTURE2 TO BRE-OUT-OUTPUT-STRUCTURE

           EXEC CICS RETURN
           END-EXEC.
