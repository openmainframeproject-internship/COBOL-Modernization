      * Generated on 8/26/2021 at 1:38:22 PM
      *
      *|COMPONENT INFO:
      *|Component type: Structure Based Slice: Range
      *|Original program: "DBANK02P"
      *|COBOL dialect: Cobol390

      *|COMPONENT TYPE SPECIFIC:
      *|Start Paragraph: READ-PROCESSING
      *|Last Paragraph: READ-PROCESSING

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
       PROGRAM-ID. READADDR.

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
       COPY 'READREQ'.
       COPY 'READRESP'.

001300 PROCEDURE DIVISION USING BRE-INP-INPUT-STRUCTURE                 centry
                                BRE-OUT-OUTPUT-STRUCTURE.

001600     PERFORM BRE-COPY-INPUT-DATA-0
           .
           PERFORM READ-PROCESSING
           .
           PERFORM BRE-COPY-OUTPUT-DATA
           .
           GOBACK
           .
008900***************************************************************** dbank02p
008900* Read request                                                  * dbank02p
009000***************************************************************** dbank02p
009100 READ-PROCESSING.                                                 dbank02p
009400***************************************************************** dbank02p
009400* Now attempt to get the requested record                       * dbank02p
009500***************************************************************** dbank02p
009600     MOVE CD02I-CONTACT-ID TO WS-BNKCUST-RID
           .                                                            dbank02p
      *227
009800     EXEC CICS READ FILE('BNKCUST')                               dbank02p
009900                    INTO(WS-BNKCUST-REC)                          dbank02p
010000                    LENGTH(LENGTH OF WS-BNKCUST-REC)              dbank02p
010100                    RIDFLD(WS-BNKCUST-RID)                        dbank02p
010200                    RESP(WS-RESP)                                 dbank02p
010300     END-EXEC
           .                                                            dbank02p
010500***************************************************************** dbank02p
010500* Did we get the record OK                                      * dbank02p
010600***************************************************************** dbank02p
010700     IF WS-RESP IS EQUAL TO DFHRESP(NORMAL)                       dbank02p
010900         MOVE BCS-REC-PID TO CD02O-CONTACT-ID                     dbank02p
011000         MOVE BCS-REC-NAME TO CD02O-CONTACT-NAME                  dbank02p
011100         MOVE BCS-REC-ADDR1 TO CD02O-CONTACT-ADDR1                dbank02p
011200         MOVE BCS-REC-ADDR2 TO CD02O-CONTACT-ADDR2                dbank02p
011300         MOVE BCS-REC-STATE TO CD02O-CONTACT-STATE                dbank02p
011400         MOVE BCS-REC-CNTRY TO CD02O-CONTACT-CNTRY                dbank02p
011500         MOVE BCS-REC-POST-CODE TO CD02O-CONTACT-PSTCDE           dbank02p
011600         MOVE BCS-REC-TEL TO CD02O-CONTACT-TELNO                  dbank02p
011700         MOVE BCS-REC-EMAIL TO CD02O-CONTACT-EMAIL                dbank02p
011800         MOVE BCS-REC-SEND-MAIL TO CD02O-CONTACT-SEND-MAIL        dbank02p
011900         MOVE BCS-REC-SEND-EMAIL TO CD02O-CONTACT-SEND-EMAIL      dbank02p
012000     END-IF
           .                                                            dbank02p
012200***************************************************************** dbank02p
012200* Was the record not found?                                     * dbank02p
012300***************************************************************** dbank02p
012400     IF WS-RESP IS NOT EQUAL TO DFHRESP(NORMAL)                   dbank02p
012600         MOVE SPACES TO CD02O-DATA                                dbank02p
012700         MOVE HIGH-VALUES TO CD02O-CONTACT-ID                     dbank02p
012800         MOVE 'Bad VSAM read' TO CD02O-CONTACT-NAME               dbank02p
012900     END-IF
           .                                                            dbank02p
       BRE-COPY-INPUT-DATA-0.
           MOVE BRE-I-CD02I-CONTACT TO CD02I-CONTACT-ID
           .
       BRE-COPY-OUTPUT-DATA.
           MOVE CD02O-DATA TO BRE-O-CD02O-DATA
           MOVE EIBRESP TO BRE-O-EIBRESP
           .
