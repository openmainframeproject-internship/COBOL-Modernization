000100***************************************************************** dbank03p
000200*                                                               * dbank03p
000300*   Copyright (C) 1998-2021 Micro Focus. All Rights Reserved.   * dbank03p
000400*   This demonstration program is provided for use by users     * dbank03p
000500*   of Micro Focus products and may be used, modified and       * dbank03p
000600*   distributed as part of your application provided that       * dbank03p
000700*   you properly acknowledge the copyright of Micro Focus       * dbank03p
000800*   in this material.                                           * dbank03p
000900*                                                               * dbank03p
001000***************************************************************** dbank03p
001100                                                                  dbank03p
001200***************************************************************** dbank03p
001300* Program:     DBANK03P.CBL                                     * dbank03p
001400* Function:    Obtain Bank Account balances                     * dbank03p
001500*              VSAM version                                     * dbank03p
001600***************************************************************** dbank03p
001700                                                                  dbank03p
001800 IDENTIFICATION DIVISION.                                         dbank03p
001900 PROGRAM-ID.                                                      dbank03p
002000     GETBAL.                                                      dbank03p
002100 DATE-WRITTEN.                                                    dbank03p
002200     September 2002.                                              dbank03p
002300 DATE-COMPILED.                                                   dbank03p
002400     Today.                                                       dbank03p
002500                                                                  dbank03p
002600 ENVIRONMENT DIVISION.                                            dbank03p
002700                                                                  dbank03p
002800 DATA DIVISION.                                                   dbank03p
002900                                                                  dbank03p
003000 WORKING-STORAGE SECTION.                                         dbank03p
003100 01  WS-MISC-STORAGE.                                             dbank03p
003200   05  WS-PROGRAM-ID                         PIC X(8)             dbank03p
003300       VALUE 'GETBAL'.                                            dbank03p
003400   05  WS-COMMAREA-LENGTH                    PIC 9(5).            dbank03p
003500   05  WS-RESP                               PIC S9(8) COMP.      dbank03p
003600   05  WS-SUB1                               PIC S9(4) COMP.      dbank03p
003700   05  WS-SUB2                               PIC S9(4) COMP.      dbank03p
003800   05  WS-COUNT                              PIC S9(4) COMP.      dbank03p
003900   05  WS-REC-TYPE                           PIC X(1).            dbank03p
004000   05  WS-REC-TYPE-N REDEFINES WS-REC-TYPE   PIC 9(1).            dbank03p
004100   05  WS-MOVED-FLAG                         PIC X(1).            dbank03p
004200     88  ENTRY-MOVED-TRUE                    VALUE '1'.           dbank03p
004300     88  ENTRY-MOVED-FALSE                   VALUE '0'.           dbank03p
004400   05  WS-BNKACCT-AIX1-RID                   PIC X(5).            dbank03p
004500   05  WS-BNKATYP-RID                        PIC X(1).            dbank03p
004600   05  WS-BNKTXN-AIX1-RID                    PIC X(31).           dbank03p
004700   05  WS-BNKTXN-AIX1-RID-LEN                PIC X(31).           dbank03p
004800                                                                  dbank03p
004900 01  WS-BNKACCT-REC.                                              dbank03p
005000 COPY CBANKVAC.                                                   dbank03p
005100                                                                  dbank03p
005200 01  WS-BNKATYP-REC.                                              dbank03p
005300 COPY CBANKVAT.                                                   dbank03p
005400                                                                  dbank03p
005500 01  WS-BNKTXN-REC.                                               dbank03p
005600 COPY CBANKVTX.                                                   dbank03p
005700                                                                  dbank03p
005800 01  WS-COMMAREA.                                                 dbank03p
005900 COPY CBANKD03.                                                   dbank03p
006000                                                                  dbank03p
006100 COPY CABENDD.                                                    dbank03p
006200                                                                  dbank03p
006300 LINKAGE SECTION.                                                 dbank03p
006400*01  DFHCOMMAREA.                                                 dbank03p
006500*  05  LK-COMMAREA                           PIC X(1)             dbank03p
006600*      OCCURS 1 TO 4096 TIMES                                     dbank03p
006700*        DEPENDING ON WS-COMMAREA-LENGTH.  
       01 DFHCOMMAREA.                                           
         05 LK-COMMAREA PIC X(6144). 
       COPY 'REQBAL'.
       COPY 'RESBAL'.
006800                                                                  dbank03p
006900 PROCEDURE DIVISION USING    CUST-ID
                                   BALANCE-OUT.                         dbank03p
007000***************************************************************** dbank03p
007100* Move the passed data to our area                              * dbank03p
007200***************************************************************** dbank03p
007300     MOVE LENGTH OF WS-COMMAREA TO WS-COMMAREA-LENGTH.            dbank03p
007400     MOVE DFHCOMMAREA TO WS-COMMAREA.
           initialize BALANCE-OUT.                                      dbank03p
007500                                                                  dbank03p
007600***************************************************************** dbank03p
007700* Initialize our output area                                    * dbank03p
007800***************************************************************** dbank03p
007900     MOVE SPACES TO CD03O-DATA.                                   dbank03p
008000                                                                  dbank03p
008100***************************************************************** dbank03p
008200* Set up the start position for the browse                      * dbank03p
008300***************************************************************** dbank03p
008400     MOVE CD03I-DATA TO WS-BNKACCT-AIX1-RID.                      dbank03p
008500                                                                  dbank03p
008600***************************************************************** dbank03p
008700* Start browsing the file                                       * dbank03p
008800***************************************************************** dbank03p
008900     EXEC CICS STARTBR FILE('BNKACC1')                            dbank03p
009000                       RIDFLD(WS-BNKACCT-AIX1-RID)                dbank03p
009100                       GTEQ                                       dbank03p
009200     END-EXEC.                                                    dbank03p
009300                                                                  dbank03p
009400***************************************************************** dbank03p
009500* Now browse the selected recs and move into our area           * dbank03p
009600***************************************************************** dbank03p
009700     DIVIDE LENGTH OF CD03O-ACC-INFO(1) INTO LENGTH OF CD03O-DATA dbank03p
009800       GIVING WS-COUNT.                                           dbank03p
009900     MOVE 0 TO WS-SUB1.                                           dbank03p
010000 ACCOUNT-FETCH-LOOP.                                              dbank03p
010100     ADD 1 TO WS-SUB1.                                            dbank03p
010200     IF WS-SUB1 IS GREATER THAN WS-COUNT                          dbank03p
010300        GO TO ACCOUNT-FETCH-LOOP-EXIT                             dbank03p
010400     END-IF.                                                      dbank03p
010500     EXEC CICS READNEXT FILE('BNKACC1')                           dbank03p
010600                        INTO(WS-BNKACCT-REC)                      dbank03p
010700                        LENGTH(LENGTH OF WS-BNKACCT-REC)          dbank03p
010800                        RIDFLD(WS-BNKACCT-AIX1-RID)               dbank03p
010900                        RESP(WS-RESP)                             dbank03p
011000     END-EXEC.                                                    dbank03p
011100     IF (WS-RESP IS NOT EQUAL TO DFHRESP(NORMAL) AND              dbank03p
011200         WS-RESP IS NOT EQUAL TO DFHRESP(DUPKEY)) OR              dbank03p
011300        BAC-REC-PID IS NOT EQUAL TO CD03I-CONTACT-ID              dbank03p
011400        GO TO ACCOUNT-FETCH-LOOP-EXIT                             dbank03p
011500     END-IF                                                       dbank03p
011600                                                                  dbank03p
011700***************************************************************** dbank03p
011800* We got an account record ok, save no & bal, get description   * dbank03p
011900* Note: We wnat the account in type order but as the files do   * dbank03p
012000*       not accomodate this, we put them in the "entry" in the  * dbank03p
012100*       output area based on type. Once all records have been   * dbank03p
012200*       obtained we examine the output area to move entries up  * dbank03p
012300*       if necessary to eliminate any embedded blank entries.   * dbank03p
012400***************************************************************** dbank03p
012500     MOVE BAC-REC-TYPE TO WS-REC-TYPE.                            dbank03p
012600     MOVE WS-REC-TYPE-N TO WS-SUB2.                               dbank03p
012700     MOVE BAC-REC-ACCNO TO CD03O-ACC-NO (WS-SUB2).                dbank03p
012800     MOVE BAC-REC-BALANCE TO CD03O-ACC-BAL-N (WS-SUB2).           dbank03p
012900     MOVE BAC-REC-LAST-STMT-DTE TO CD03O-DTE (WS-SUB2).           dbank03p
013000     MOVE BAC-REC-TYPE TO WS-BNKATYP-RID.                         dbank03p
013100     EXEC CICS READ FILE('BNKATYPE')                              dbank03p
013200                        INTO(WS-BNKATYP-REC)                      dbank03p
013300                        LENGTH(LENGTH OF WS-BNKATYP-REC)          dbank03p
013400                        RIDFLD(WS-BNKATYP-RID)                    dbank03p
013500                        RESP(WS-RESP)                             dbank03p
013600     END-EXEC.                                                    dbank03p
013700     IF WS-RESP IS EQUAL TO DFHRESP(NORMAL)                       dbank03p
013800        MOVE BAT-REC-DESC TO CD03O-ACC-DESC (WS-SUB2)             dbank03p
013900     ELSE                                                         dbank03p
014000        MOVE 'Unkown' TO CD03O-ACC-DESC (WS-SUB2)                 dbank03p
014100     END-IF.                                                      dbank03p
014200                                                                  dbank03p
014300***************************************************************** dbank03p
014400* Now see if there are any transactions for this account        * dbank03p
014500***************************************************************** dbank03p
014600     MOVE BAC-REC-ACCNO TO WS-BNKTXN-AIX1-RID.                    dbank03p
014700     EXEC CICS READ FILE('BNKTXN1')                               dbank03p
014800                        INTO(WS-BNKTXN-REC)                       dbank03p
014900                        LENGTH(LENGTH OF WS-BNKTXN-REC)           dbank03p
015000                        RIDFLD(WS-BNKTXN-AIX1-RID)                dbank03p
015100                        KEYLENGTH(9)                              dbank03p
015200                        GENERIC                                   dbank03p
015300                        RESP(WS-RESP)                             dbank03p
015400     END-EXEC.                                                    dbank03p
015500     IF WS-RESP IS EQUAL TO DFHRESP(NORMAL)                       dbank03p
015600        MOVE '*' TO CD03O-TXN (WS-SUB2)                           dbank03p
015700     ELSE                                                         dbank03p
015800        MOVE ' ' TO CD03O-TXN (WS-SUB2)                           dbank03p
015900     END-IF.                                                      dbank03p
016000     GO TO ACCOUNT-FETCH-LOOP.                                    dbank03p
016100                                                                  dbank03p
016200***************************************************************** dbank03p
016300* We quit the loop for some reason                              * dbank03p
016400***************************************************************** dbank03p
016500 ACCOUNT-FETCH-LOOP-EXIT.                                         dbank03p
016600     EXEC CICS ENDBR FILE('BNKACC1')                              dbank03p
016700     END-EXEC.                                                    dbank03p
016800                                                                  dbank03p
016900***************************************************************** dbank03p
017000* We examine the output area an move entries as required so as  * dbank03p
017100* to eliminate any embedded blank entries                       * dbank03p
017200***************************************************************** dbank03p
017300 COMPRESS-000.                                                    dbank03p
017400     MOVE 1 TO WS-SUB1.                                           dbank03p
017500     MOVE 1 TO WS-SUB2.                                           dbank03p
017600     SET ENTRY-MOVED-FALSE TO TRUE.                               dbank03p
017700 COMPRESS-100.                                                    dbank03p
017800* Check to see if we have done it all                             dbank03p
017900     IF WS-SUB1 IS EQUAL WS-COUNT                                 dbank03p
018000        GO TO COMPRESS-200                                        dbank03p
018100     END-IF.                                                      dbank03p
018200     ADD 1 TO WS-SUB2                                             dbank03p
018300     IF CD03O-ACC-INFO(WS-SUB1) IS EQUAL TO SPACES AND            dbank03p
018400        WS-SUB2 IS NOT GREATER THAN WS-COUNT                      dbank03p
018500        IF CD03O-ACC-INFO(WS-SUB2) IS NOT EQUAL TO SPACES         dbank03p
018600           MOVE CD03O-ACC-INFO(WS-SUB2) TO CD03O-ACC-INFO(WS-SUB1)dbank03p
018700           MOVE SPACES TO CD03O-ACC-INFO(WS-SUB2)                 dbank03p
018800           ADD 1 TO WS-SUB1                                       dbank03p
018900           MOVE WS-SUB1 TO WS-SUB2                                dbank03p
019000           SET ENTRY-MOVED-TRUE TO TRUE                           dbank03p
019100           GO TO COMPRESS-000                                     dbank03p
019200        END-IF                                                    dbank03p
019300     ELSE                                                         dbank03p
019400       ADD 1 TO WS-SUB1                                           dbank03p
019500       GO TO COMPRESS-100                                         dbank03p
019600     END-IF.                                                      dbank03p
019700     GO TO COMPRESS-100.                                          dbank03p
019800 COMPRESS-200.                                                    dbank03p
019900     IF ENTRY-MOVED-TRUE                                          dbank03p
020000        GO TO COMPRESS-000                                        dbank03p
020100     END-IF.                                                      dbank03p
020200                                                                  dbank03p
020300***************************************************************** dbank03p
020400* Move the result back to the callers area                      * dbank03p
020500***************************************************************** dbank03p
020600     MOVE WS-COMMAREA TO DFHCOMMAREA(1:WS-COMMAREA-LENGTH). 
           
020700     MOVE WS-COMMAREA TO BALANCE-OUT. 
           MOVE OUT03O-BAL5 TO OUT03O-BAL6.                             dbank03p
020800***************************************************************** dbank03p
020900* Return to our caller                                          * dbank03p
021000***************************************************************** dbank03p
021100 GOBACK.                                                          dbank03p
021200                                                                  dbank03p
021300* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     dbank03p
