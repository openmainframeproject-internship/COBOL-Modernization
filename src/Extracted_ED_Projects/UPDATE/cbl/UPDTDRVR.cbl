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
       PROGRAM-ID. UPDTDRVR.

       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 BRE-OUT-OUTPUT-STRUCTURE2.
         02 BRE-O-CD02O-DATA.
           03 BRE-O-CD02O-CONTACT PIC X(5).
           03 BRE-O-CD02O-CONTACT8 PIC X(25).
           03 BRE-O-CD02O-CONTACT9 PIC X(25).
           03 BRE-O-CD02O-CONTACT10 PIC X(25).
           03 BRE-O-CD02O-CONTACT11 PIC X(2).
           03 BRE-O-CD02O-CONTACT12 PIC X(6).
           03 BRE-O-CD02O-CONTACT13 PIC X(6).
           03 BRE-O-CD02O-CONTACT14 PIC X(12).
           03 BRE-O-CD02O-CONTACT15 PIC X(30).
           03 BRE-O-CD02O-CONTACT16 PIC X(1).
           03 BRE-O-CD02O-CONTACT17 PIC X(1).
         02 BRE-O-EIBRESP PIC S9(8) USAGE IS BINARY.
         02 RW-GOBACK-FLAG PIC 9.

       LINKAGE SECTION.

       COPY 'UPDTREQ'.
       COPY 'UPDTRESP'.

       PROCEDURE DIVISION.
       000-START-PROCESSING.

           SET ADDRESS OF BRE-INP-INPUT-STRUCTURE
              TO ADDRESS OF DFHCOMMAREA
           
           CALL 'UPDTADDR' USING DFHEIBLK
                                DFHCOMMAREA
                                BRE-INP-INPUT-STRUCTURE
                                BRE-OUT-OUTPUT-STRUCTURE2 

           SET ADDRESS OF BRE-OUT-OUTPUT-STRUCTURE
              TO ADDRESS OF DFHCOMMAREA

           MOVE BRE-OUT-OUTPUT-STRUCTURE2 TO BRE-OUT-OUTPUT-STRUCTURE

           EXEC CICS RETURN
           END-EXEC.
