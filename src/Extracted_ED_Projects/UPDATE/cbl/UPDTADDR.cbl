      * Generated on 8/26/2021 at 1:57:57 PM
      *
      *|COMPONENT INFO:
      *|Component type: Structure Based Slice: Range
      *|Original program: "DBANK02P"
      *|COBOL dialect: Cobol390

      *|COMPONENT TYPE SPECIFIC:
      *|Start Paragraph: WRITE-PROCESSING
      *|Last Paragraph: WRITE-PROCESSING

      *|THIS IS THE LAST LINE OF GENERATED HEADER

000100***************************************************************** dbank02p
000100*                                                               * dbank02p
000200*   Copyright (C) 1998-2021 Micro Focus. All Rights Reserved.   * dbank02p
000300*   This demonstration program is provided for use by users     * dbank02p
000400*   of Micro Focus products and may be used, modified and       * dbank02p
000500*   distributed as part of your application provided that       * dbank02p
000600*   you properly acknowledge the copyright of Micro Focus       * dbank02p
000700*   in this material.                                           * dbank02p
000800*                                                               * dbank02p
000900***************************************************************** dbank02p

001200***************************************************************** dbank02p
001200* Program:     DBANK02P.CBL                                     * dbank02p
001300* Function:    Obtain/update address information                * dbank02p
001400*              VSAM version                                     * dbank02p
001500***************************************************************** dbank02p
001600 IDENTIFICATION DIVISION.                                         dbank02p
       PROGRAM-ID. UPDTADDR.

002600 ENVIRONMENT DIVISION.                                            dbank02p
002700                                                                  dbank02p
002800 DATA DIVISION.                                                   dbank02p
003100 WORKING-STORAGE SECTION.                                         dbank02p
003100 01 WS-MISC-STORAGE.                                              dbank02p
003200   05 WS-PROGRAM-ID PIC X(8) VALUE 'DBANK02P'.                    dbank02p
003300                                                                  dbank02p
003400   05 WS-COMMAREA-LENGTH PIC 9(5).                                dbank02p
003500   05 WS-RESP PIC S9(8) COMP.                                     dbank02p
003600   05 WS-BNKCUST-RID PIC X(5).                                    dbank02p
003800 01 WS-BNKCUST-REC.                                               dbank02p
003800                                                                  dbank02p
003900 COPY CBANKVCS.                                                   dbank02p
004100 01 WS-COMMAREA.                                                  dbank02p
004100                                                                  dbank02p
004200 COPY CBANKD02.                                                   dbank02p
004600 LINKAGE SECTION.                                                 dbank02p
004600 01 DFHCOMMAREA.                                                  dbank02p
004800   05 LK-COMMAREA PIC X(1) OCCURS 1 TO 4096 TIMES DEPENDING ON    dbank02p
004900                                                                  dbank02p
005000                  WS-COMMAREA-LENGTH.                             dbank02p
       COPY 'UPDTREQ'.
       COPY 'UPDTRESP'.
000100***************************************************************** centry
000100*                                                               * centry
000200*  Copyright(C) 1998-2010 Micro Focus. All Rights Reserved.     * centry
000300*                                                               * centry
000400***************************************************************** centry

000700***************************************************************** centry
000700* CENTRY.CPY (CICS Version)                                     * centry
000800*---------------------------------------------------------------* centry
000900* This copybook is used to provide an entry point for modules   * centry
001000* so that they may be insensitive to their environment.         * centry
001100* There are different versions for CICS, IMS and INET.          * centry
001200***************************************************************** centry
001300 PROCEDURE DIVISION USING BRE-INP-INPUT-STRUCTURE                 centry
                                BRE-OUT-OUTPUT-STRUCTURE.
001600* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     centry
001600     PERFORM BRE-COPY-INPUT-DATA-0
           .
           PERFORM WRITE-PROCESSING
           .
           MOVE 1 TO RW-GOBACK-FLAG
           PERFORM BRE-COPY-OUTPUT-DATA
           GOBACK
           .
013400***************************************************************** dbank02p
013400* Write request                                                 * dbank02p
013500***************************************************************** dbank02p
013600 WRITE-PROCESSING.                                                dbank02p
013900***************************************************************** dbank02p
013900* Now attempt to get the requested record for update            * dbank02p
014000***************************************************************** dbank02p
014100     MOVE CD02I-CONTACT-ID TO WS-BNKCUST-RID
           .                                                            dbank02p
      *272
014300     EXEC CICS READ FILE('BNKCUST')                               dbank02p
014400                    UPDATE                                        dbank02p
014500                    INTO(WS-BNKCUST-REC)                          dbank02p
014600                    LENGTH(LENGTH OF WS-BNKCUST-REC)              dbank02p
014700                    RIDFLD(WS-BNKCUST-RID)                        dbank02p
014800                    RESP(WS-RESP)                                 dbank02p
014900     END-EXEC
           .                                                            dbank02p
015100***************************************************************** dbank02p
015100* Did we get the record for update                              * dbank02p
015200***************************************************************** dbank02p
015300     IF WS-RESP IS NOT EQUAL TO DFHRESP(NORMAL)                   dbank02p
015500         MOVE SPACES TO CD02O-DATA                                dbank02p
015600         MOVE HIGH-VALUES TO CD02O-CONTACT-ID                     dbank02p
015700         MOVE 'Unable to lock record' TO CD02O-CONTACT-NAME       dbank02p
015800         GO TO WRITE-PROCESSING-EXIT                              dbank02p
015900     END-IF
           .                                                            dbank02p
016100     MOVE CD02I-CONTACT-ADDR1 TO BCS-REC-ADDR1
           .                                                            dbank02p
016200     MOVE CD02I-CONTACT-ADDR2 TO BCS-REC-ADDR2
           .                                                            dbank02p
016300     MOVE CD02I-CONTACT-STATE TO BCS-REC-STATE
           .                                                            dbank02p
016400     MOVE CD02I-CONTACT-CNTRY TO BCS-REC-CNTRY
           .                                                            dbank02p
016500     MOVE CD02I-CONTACT-PSTCDE TO BCS-REC-POST-CODE
           .                                                            dbank02p
016600     MOVE CD02I-CONTACT-STATE TO BCS-REC-STATE
           .                                                            dbank02p
016700     MOVE CD02I-CONTACT-EMAIL TO BCS-REC-EMAIL
           .                                                            dbank02p
016800     MOVE CD02I-CONTACT-SEND-MAIL TO BCS-REC-SEND-MAIL
           .                                                            dbank02p
016900     MOVE CD02I-CONTACT-SEND-EMAIL TO BCS-REC-SEND-EMAIL
           .                                                            dbank02p
      *299
017000     EXEC CICS REWRITE FILE('BNKCUST')                            dbank02p
017100                       FROM(WS-BNKCUST-REC)                       dbank02p
017200                       LENGTH(LENGTH OF WS-BNKCUST-REC)           dbank02p
017300                       RESP(WS-RESP)                              dbank02p
017400     END-EXEC
           .                                                            dbank02p
017600***************************************************************** dbank02p
017600* Did we update the record OK                                   * dbank02p
017700***************************************************************** dbank02p
017800     IF WS-RESP IS EQUAL TO DFHRESP(NORMAL)                       dbank02p
018000         MOVE HIGH-VALUES TO CD02O-CONTACT-ID                     dbank02p
018100         MOVE 'Update OK' TO CD02O-CONTACT-NAME                   dbank02p
018200     END-IF
           .                                                            dbank02p
018400***************************************************************** dbank02p
018400* The record update failed                                      * dbank02p
018500***************************************************************** dbank02p
018600     IF WS-RESP IS NOT EQUAL TO DFHRESP(NORMAL)                   dbank02p
018800         MOVE SPACES TO CD02O-DATA                                dbank02p
018900         MOVE HIGH-VALUES TO CD02O-CONTACT-ID                     dbank02p
019000         MOVE 'Update failed' TO CD02O-CONTACT-NAME               dbank02p
019100     END-IF
           .                                                            dbank02p
019300 WRITE-PROCESSING-EXIT.                                           dbank02p
019300     PERFORM BRE-COPY-OUTPUT-DATA
           .                                                            dbank02p
019500                                                                  dbank02p
019600*                                                                 dbank02p
       BRE-EXIT-PROGRAM.
           GOBACK
           .
       BRE-COPY-INPUT-DATA-0.
           MOVE BRE-I-CD02I-CONTACT TO CD02I-CONTACT-ID
           MOVE BRE-I-CD02I-CONTACT0 TO CD02I-CONTACT-ADDR1
           MOVE BRE-I-CD02I-CONTACT1 TO CD02I-CONTACT-ADDR2
           MOVE BRE-I-CD02I-CONTACT2 TO CD02I-CONTACT-STATE
           MOVE BRE-I-CD02I-CONTACT3 TO CD02I-CONTACT-CNTRY
           MOVE BRE-I-CD02I-CONTACT4 TO CD02I-CONTACT-PSTCDE
           MOVE BRE-I-CD02I-CONTACT5 TO CD02I-CONTACT-EMAIL
           MOVE BRE-I-CD02I-CONTACT6 TO CD02I-CONTACT-SEND-MAIL
           MOVE BRE-I-CD02I-CONTACT7 TO CD02I-CONTACT-SEND-EMAIL
           .
       BRE-COPY-OUTPUT-DATA.
           MOVE CD02O-DATA TO BRE-O-CD02O-DATA
           MOVE EIBRESP TO BRE-O-EIBRESP
           .
