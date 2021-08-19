000100***************************************************************** dbank01p
000200*                                                               * dbank01p
000300*   Copyright (C) 1998-2021 Micro Focus. All Rights Reserved.   * dbank01p
000400*   This demonstration program is provided for use by users     * dbank01p
000500*   of Micro Focus products and may be used, modified and       * dbank01p
000600*   distributed as part of your application provided that       * dbank01p
000700*   you properly acknowledge the copyright of Micro Focus       * dbank01p
000800*   in this material.                                           * dbank01p
000900*                                                               * dbank01p
001000***************************************************************** dbank01p
001100                                                                  dbank01p
001200***************************************************************** dbank01p
001300* Program:     DBANK01P.CBL                                     * dbank01p
001400* Function:    Obtain User details                              * dbank01p
001500*              VSAM version                                     * dbank01p
001600***************************************************************** dbank01p
001700                                                                  dbank01p
001800 IDENTIFICATION DIVISION.                                         dbank01p
001900 PROGRAM-ID.                                                      dbank01p
002000     DBANK01P.                                                    dbank01p
002100 DATE-WRITTEN.                                                    dbank01p
002200     September 2002.                                              dbank01p
002300 DATE-COMPILED.                                                   dbank01p
002400     Today.                                                       dbank01p
002500                                                                  dbank01p
002600 ENVIRONMENT DIVISION.                                            dbank01p
002700                                                                  dbank01p
002800 DATA DIVISION.                                                   dbank01p
002900                                                                  dbank01p
003000 WORKING-STORAGE SECTION.                                         dbank01p
003100 01  WS-MISC-STORAGE.                                             dbank01p
003200   05  WS-PROGRAM-ID                         PIC X(8)             dbank01p
003300       VALUE 'DBANK01P'.                                          dbank01p
003400   05  WS-COMMAREA-LENGTH                    PIC 9(5).            dbank01p
003500   05  WS-RESP                               PIC S9(8) COMP.      dbank01p
003600   05  WS-BNKCUST-RID                        PIC X(5).            dbank01p
003700                                                                  dbank01p
003800 01 WS-BNKCUST-REC.                                               dbank01p
003900 COPY CBANKVCS.                                                   dbank01p
004000                                                                  dbank01p
004100 01  WS-COMMAREA.                                                 dbank01p
004200 COPY CBANKD01.                                                   dbank01p
004300                                                                  dbank01p
004400 COPY CABENDD.                                                    dbank01p
004500                                                                  dbank01p
004600 LINKAGE SECTION.                                                 dbank01p
004700 01  DFHCOMMAREA.                                                 dbank01p
004800   05  LK-COMMAREA                           PIC X(1)             dbank01p
004900       OCCURS 1 TO 4096 TIMES                                     dbank01p
005000         DEPENDING ON WS-COMMAREA-LENGTH.                         dbank01p
005100                                                                  dbank01p
005200* COPY CENTRY.                                                    dbank01p
001400 PROCEDURE DIVISION.                                              centry
001500                                                                  centry
005300***************************************************************** dbank01p
005400* Move the passed data to our area                              * dbank01p
005500***************************************************************** dbank01p
005600     MOVE LENGTH OF WS-COMMAREA TO WS-COMMAREA-LENGTH.            dbank01p
005700     MOVE DFHCOMMAREA TO WS-COMMAREA
005800                                                                  dbank01p
005900***************************************************************** dbank01p
006000* Initialize our output area                                    * dbank01p
006100***************************************************************** dbank01p
006200     MOVE SPACES TO CD01O-DATA                                    dbank01p
006300     MOVE CD01I-PERSON-PID TO WS-BNKCUST-RID
006400***************************************************************** dbank01p
006500* Now attempt to get the requested record                       * dbank01p
006600***************************************************************** dbank01p
006800     EXEC CICS READ FILE('BNKCUST')                               dbank01p
006900                    INTO(WS-BNKCUST-REC)                          dbank01p
007000                    LENGTH(LENGTH OF WS-BNKCUST-REC)              dbank01p
007100                    RIDFLD(WS-BNKCUST-RID)                        dbank01p
007200                    RESP(WS-RESP)                                 dbank01p
007300     END-EXEC.                                                    dbank01p
007400                                                                  dbank01p
007500***************************************************************** dbank01p
007600* Did we get the record OK                                      * dbank01p
007700***************************************************************** dbank01p
007800     IF WS-RESP IS EQUAL TO DFHRESP(NORMAL)                       dbank01p
007900        MOVE BCS-REC-PID TO CD01O-PERSON-PID                      dbank01p
008000        MOVE BCS-REC-NAME TO CD01O-PERSON-NAME                    dbank01p
008100     END-IF.                                                      dbank01p
008200                                                                  dbank01p
008300***************************************************************** dbank01p
008400* Was the record not found?                                     * dbank01p
008500***************************************************************** dbank01p
008600     IF WS-RESP IS NOT EQUAL TO DFHRESP(NORMAL)                   dbank01p
008700        MOVE 'Person not found' TO CD01O-PERSON-NAME              dbank01p
008800     END-IF.                                                      dbank01p
008900                                                                  dbank01p
009000***************************************************************** dbank01p
009100* Move the result back to the callers area                      * dbank01p
009200***************************************************************** dbank01p
009300     MOVE WS-COMMAREA TO DFHCOMMAREA(1:WS-COMMAREA-LENGTH).       dbank01p
009400                                                                  dbank01p
009500***************************************************************** dbank01p
009600* Return to our caller                                          * dbank01p
009700***************************************************************** dbank01p
009800* COPY CRETURN.                                                   dbank01p
001400     EXEC CICS RETURN                                             creturn
001500     END-EXEC.                                                    creturn
001600     GOBACK.                                                      creturn
001700                                                                  creturn

009900                                                                  dbank01p
010000* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     dbank01p
