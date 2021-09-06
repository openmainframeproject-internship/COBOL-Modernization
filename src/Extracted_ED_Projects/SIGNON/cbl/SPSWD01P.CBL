000100***************************************************************** spswd01p
000200*                                                               * spswd01p
000300*   Copyright (C) 1998-2021 Micro Focus. All Rights Reserved.   * spswd01p
000400*   This demonstration program is provided for use by users     * spswd01p
000500*   of Micro Focus products and may be used, modified and       * spswd01p
000600*   distributed as part of your application provided that       * spswd01p
000700*   you properly acknowledge the copyright of Micro Focus       * spswd01p
000800*   in this material.                                           * spswd01p
000900*                                                               * spswd01p
001000***************************************************************** spswd01p
001100                                                                  spswd01p
001200***************************************************************** spswd01p
001300* Program:     SPSWD01P.CBL (CICS Version)                      * spswd01p
001400* Layer:       Transaction manager specific                     * spswd01p
001500* Function:    Perform security operations (sigon, signoff etc)  *spswd01p
001600***************************************************************** spswd01p
001700                                                                  spswd01p
001800 IDENTIFICATION DIVISION.                                         spswd01p
001900 PROGRAM-ID.                                                      spswd01p
002000     SPSWD01P.                                                    spswd01p
002100 DATE-WRITTEN.                                                    spswd01p
002200     September 2002.                                              spswd01p
002300 DATE-COMPILED.                                                   spswd01p
002400     Today.                                                       spswd01p
002500                                                                  spswd01p
002600 ENVIRONMENT DIVISION.                                            spswd01p
002700                                                                  spswd01p
002800 DATA DIVISION.                                                   spswd01p
002900                                                                  spswd01p
003000 WORKING-STORAGE SECTION.                                         spswd01p
003100 01  WS-MISC-STORAGE.                                             spswd01p
003200   05  WS-PROGRAM-ID                         PIC X(8)             spswd01p
003300       VALUE 'SPSWD01P'.                                          spswd01p
003400   05  WS-COMMAREA-LENGTH                    PIC 9(5).            spswd01p
003500   05  WS-RESP                               PIC S9(8) COMP.      spswd01p
003600   05  WS-EIBRESP-DISP                       PIC ZZ9.             spswd01p
003700   05  WS-EIBRESP2-DISP                      PIC ZZ9.             spswd01p
003800   05  WS-SECURITY-TRAN                      PIC X(8).            spswd01p
003900   05  WS-SECURITY-FLAG                      PIC X(1).            spswd01p
004000     88  SECURITY-REQUIRED                   VALUE 'Y'.           spswd01p
004100                                                                  spswd01p
004200 01  WS-COMMAREA.                                                 spswd01p
004300 COPY CPSWDD01.                                                   spswd01p
004400                                                                  spswd01p
004500 01  WS-MSG-DATA                             PIC X(80).           spswd01p
004600 01  WS-MSG-LEN                              PIC S9(8) COMP.      spswd01p
004700                                                                  spswd01p
004800 COPY CABENDD.                                                    spswd01p
004900                                                                  spswd01p
005000 LINKAGE SECTION.                                                 spswd01p
005100 01  DFHCOMMAREA.                                                 spswd01p
005200   05  LK-COMMAREA                           PIC X(1)             spswd01p
005300       OCCURS 1 TO 4096 TIMES                                     spswd01p
005400         DEPENDING ON WS-COMMAREA-LENGTH.                         spswd01p
005500                                                                  spswd01p
005600* COPY CENTRY.                                                    spswd01p
001400 PROCEDURE DIVISION.                                              centry
001500                                                                  centry
005700***************************************************************** spswd01p
005800* Move the passed data to our area                              * spswd01p
005900***************************************************************** spswd01p
006000     MOVE LENGTH OF WS-COMMAREA TO WS-COMMAREA-LENGTH.            spswd01p
006100     MOVE DFHCOMMAREA TO WS-COMMAREA.                             spswd01p
006200                                                                  spswd01p
006300***************************************************************** spswd01p
006400* Initialize our output area                                    * spswd01p
006500***************************************************************** spswd01p
006600     MOVE SPACES TO CPSWDD01O-DATA.                               spswd01p
006700                                                                  spswd01p
006800***************************************************************** spswd01p
006900* Call SSECUREP to see if we need to do security processing     * spswd01p
007000***************************************************************** spswd01p
007100     MOVE EIBTRNID TO WS-SECURITY-TRAN.                           spswd01p
007200     CALL 'SSECUREP' USING WS-SECURITY-TRAN                       spswd01p
007300                           WS-SECURITY-FLAG.                      spswd01p
007400                                                                  spswd01p
007500***************************************************************** spswd01p
007600* If required perform requested processing                      * spswd01p
007700***************************************************************** spswd01p
007800     IF SECURITY-REQUIRED                                         spswd01p
007900        EVALUATE TRUE                                             spswd01p
008000          WHEN PSWD-NOOP                                          spswd01p
008100            PERFORM NOOP-PROCESS                                  spswd01p
008200          WHEN PSWD-SIGNON                                        spswd01p
008300            PERFORM SIGNON-PROCESS                                spswd01p
008400          WHEN PSWD-SIGNOFF                                       spswd01p
008500            PERFORM SIGNOFF-PROCESS                               spswd01p
008600          WHEN OTHER                                              spswd01p
008700            PERFORM NOOP-PROCESS                                  spswd01p
008800        END-EVALUATE                                              spswd01p
008900     END-IF.                                                      spswd01p
009000     INSPECT CPSWDD01O-MESSAGE REPLACING ALL '~' BY ' '.          spswd01p
009100                                                                  spswd01p
009200***************************************************************** spswd01p
009300* Move the result back to the callers area                      * spswd01p
009400***************************************************************** spswd01p
009500     MOVE WS-COMMAREA TO DFHCOMMAREA(1:WS-COMMAREA-LENGTH).       spswd01p
009600                                                                  spswd01p
009700***************************************************************** spswd01p
009800* Return to our caller                                          * spswd01p
009900***************************************************************** spswd01p
010000* COPY CRETURN.                                                   spswd01p
001400     EXEC CICS RETURN                                             creturn
001500     END-EXEC.                                                    creturn
001600     GOBACK.                                                      creturn
001700                                                                  creturn

010100                                                                  spswd01p
010200***************************************************************** spswd01p
010300* SIGNON Process                                                * spswd01p
010400***************************************************************** spswd01p
010500 SIGNON-PROCESS.                                                  spswd01p
010600     EXEC CICS SIGNOFF                                            spswd01p
010700          RESP(WS-RESP)                                           spswd01p
010800     END-EXEC.                                                    spswd01p
010900                                                                  spswd01p
011000     EXEC CICS SIGNON                                             spswd01p
011100          USERID(CPSWDD01I-USERID)                                spswd01p
011200          PASSWORD(CPSWDD01I-PASSWORD)                            spswd01p
011300          RESP(WS-RESP)                                           spswd01p
011400     END-EXEC.                                                    spswd01p
011500     IF WS-RESP IS EQUAL TO DFHRESP(USERIDERR) AND                spswd01p
011600        EIBRESP2 IS EQUAL TO 8                                    spswd01p
011700        MOVE FUNCTION LOWER-CASE(CPSWDD01I-USERID)                spswd01p
011800          TO CPSWDD01I-USERID                                     spswd01p
011900        EXEC CICS SIGNON                                          spswd01p
012000             USERID(CPSWDD01I-USERID)                             spswd01p
012100             PASSWORD(CPSWDD01I-PASSWORD)                         spswd01p
012200             RESP(WS-RESP)                                        spswd01p
012300        END-EXEC                                                  spswd01p
012400     END-IF.                                                      spswd01p
012500                                                                  spswd01p
012600     IF WS-RESP IS NOT EQUAL TO DFHRESP(NORMAL)                   spswd01p
012700        MOVE EIBRESP TO WS-EIBRESP-DISP                           spswd01p
012800        MOVE EIBRESP2 TO WS-EIBRESP2-DISP                         spswd01p
012900        MOVE SPACES TO WS-MSG-DATA                                spswd01p
013000        IF WS-RESP IS EQUAL TO DFHRESP(NOTAUTH)                   spswd01p
013100           IF EIBRESP2 IS EQUAL TO 1                              spswd01p
013200              MOVE 'A password is required~'                      spswd01p
013300                TO WS-MSG-DATA                                    spswd01p
013400           END-IF                                                 spswd01p
013500           IF EIBRESP2 IS EQUAL TO 2                              spswd01p
013600              MOVE 'The supplied password is wrong~'              spswd01p
013700                TO WS-MSG-DATA                                    spswd01p
013800           END-IF                                                 spswd01p
013900           IF EIBRESP2 IS EQUAL TO 3                              spswd01p
014000              MOVE 'A new password is requied~'                   spswd01p
014100                TO WS-MSG-DATA                                    spswd01p
014200           END-IF                                                 spswd01p
014300           IF EIBRESP2 IS EQUAL TO 4                              spswd01p
014400              MOVE 'The new password is not acceptable~'          spswd01p
014500                TO WS-MSG-DATA                                    spswd01p
014600           END-IF                                                 spswd01p
014700           IF EIBRESP2 IS EQUAL TO 19                             spswd01p
014800              MOVE 'The USERID is revoked~'                       spswd01p
014900                TO WS-MSG-DATA                                    spswd01p
015000           END-IF                                                 spswd01p
015100           IF WS-MSG-DATA IS EQUAL TO SPACES                      spswd01p
015200              STRING 'EIBRESP=NOTAUTH, EIBRESP2='                 spswd01p
015300                       DELIMITED BY SIZE                          spswd01p
015400                     WS-EIBRESP2-DISP DELIMITED BY SIZE           spswd01p
015500                     '~' DELIMITED BY SIZE                        spswd01p
015600                INTO WS-MSG-DATA                                  spswd01p
015700           END-IF                                                 spswd01p
015800        END-IF                                                    spswd01p
015900        IF WS-RESP IS EQUAL TO DFHRESP(USERIDERR)                 spswd01p
016000           IF EIBRESP2 IS EQUAL TO 8                              spswd01p
016100              MOVE 'USERID not known to security manager~'        spswd01p
016200                TO WS-MSG-DATA                                    spswd01p
016300           END-IF                                                 spswd01p
016400           IF EIBRESP2 IS EQUAL TO 30                             spswd01p
016500              MOVE 'USERID is blank/null~'                        spswd01p
016600                TO WS-MSG-DATA                                    spswd01p
016700           END-IF                                                 spswd01p
016800           IF WS-MSG-DATA IS EQUAL TO SPACES                      spswd01p
016900              STRING 'EIBRESP=USERIDERR, EIBRESP2='               spswd01p
017000                       DELIMITED BY SIZE                          spswd01p
017100                     WS-EIBRESP2-DISP DELIMITED BY SIZE           spswd01p
017200                     '~' DELIMITED BY SIZE                        spswd01p
017300                INTO WS-MSG-DATA                                  spswd01p
017400           END-IF                                                 spswd01p
017500        END-IF                                                    spswd01p
017600        IF WS-RESP IS EQUAL TO DFHRESP(INVREQ)                    spswd01p
017700           IF WS-MSG-DATA IS EQUAL TO SPACES                      spswd01p
017800              STRING 'EIBRESP=NOTAUTH, EIBRESP2='                 spswd01p
017900                       DELIMITED BY SIZE                          spswd01p
018000                     WS-EIBRESP2-DISP DELIMITED BY SIZE           spswd01p
018100                     '~' DELIMITED BY SIZE                        spswd01p
018200                INTO WS-MSG-DATA                                  spswd01p
018300           END-IF                                                 spswd01p
018400        END-IF                                                    spswd01p
018500        IF WS-RESP IS NOT EQUAL TO DFHRESP(INVREQ) AND            spswd01p
018600           WS-RESP IS NOT EQUAL TO DFHRESP(NOTAUTH) AND           spswd01p
018700           WS-RESP IS NOT EQUAL TO DFHRESP(USERIDERR)             spswd01p
018800           STRING EIBTRMID DELIMITED BY SIZE                      spswd01p
018900                  ' Invalid request. EIBRESP=' DELIMITED BY SIZE  spswd01p
019000                  WS-EIBRESP-DISP DELIMITED BY SIZE               spswd01p
019100                  ', EIBRESP2=' DELIMITED BY SIZE                 spswd01p
019200                  WS-EIBRESP2-DISP DELIMITED BY SIZE              spswd01p
019300                  '~' DELIMITED BY SIZE                           spswd01p
019400             INTO WS-MSG-DATA                                     spswd01p
019500           MOVE WS-MSG-DATA TO CPSWDD01O-MESSAGE                  spswd01p
019600           PERFORM DISPLAY-MSG                                    spswd01p
019700        END-IF                                                    spswd01p
019800        MOVE WS-MSG-DATA TO CPSWDD01O-MESSAGE                     spswd01p
019900        PERFORM DISPLAY-MSG                                       spswd01p
020000     END-IF.                                                      spswd01p
020100                                                                  spswd01p
020200 SIGNON-PROCESS-EXIT.                                             spswd01p
020300     EXIT.                                                        spswd01p
020400                                                                  spswd01p
020500***************************************************************** spswd01p
020600* SIGNOFF Process                                               * spswd01p
020700***************************************************************** spswd01p
020800 SIGNOFF-PROCESS.                                                 spswd01p
020900     EXEC CICS SIGNOFF                                            spswd01p
021000          RESP(WS-RESP)                                           spswd01p
021100     END-EXEC.                                                    spswd01p
021200     IF WS-RESP IS EQUAL TO DFHRESP(NORMAL)                       spswd01p
021300        GO TO SIGNOFF-PROCESS-EXIT                                spswd01p
021400     END-IF.                                                      spswd01p
021500     MOVE EIBRESP TO WS-EIBRESP-DISP.                             spswd01p
021600     MOVE EIBRESP2 TO WS-EIBRESP2-DISP.                           spswd01p
021700     IF WS-RESP IS EQUAL TO DFHRESP(INVREQ)                       spswd01p
021800        MOVE SPACES TO WS-MSG-DATA                                spswd01p
021900        STRING EIBTRMID DELIMITED BY SIZE                         spswd01p
022000               ' Invalid operation. EIBRESP=' DELIMITED BY SIZE   spswd01p
022100               WS-EIBRESP-DISP DELIMITED BY SIZE                  spswd01p
022200               ', EIBRESP2=' DELIMITED BY SIZE                    spswd01p
022300               WS-EIBRESP2-DISP DELIMITED BY SIZE                 spswd01p
022400               '~' DELIMITED BY SIZE                              spswd01p
022500          INTO WS-MSG-DATA                                        spswd01p
022600        PERFORM DISPLAY-MSG                                       spswd01p
022700        GO TO SIGNOFF-PROCESS-EXIT                                spswd01p
022800     ELSE                                                         spswd01p
022900        MOVE SPACES TO WS-MSG-DATA                                spswd01p
023000        STRING EIBTRMID DELIMITED BY SIZE                         spswd01p
023100               ' Invalid request. EIBRESP=' DELIMITED BY SIZE     spswd01p
023200               WS-EIBRESP-DISP DELIMITED BY SIZE                  spswd01p
023300               ', EIBRESP2=' DELIMITED BY SIZE                    spswd01p
023400               WS-EIBRESP2-DISP DELIMITED BY SIZE                 spswd01p
023500               '~' DELIMITED BY SIZE                              spswd01p
023600          INTO WS-MSG-DATA                                        spswd01p
023700        PERFORM DISPLAY-MSG                                       spswd01p
023800        GO TO SIGNOFF-PROCESS-EXIT                                spswd01p
023900     END-IF                                                       spswd01p
024000     .                                                            spswd01p
024100 SIGNOFF-PROCESS-EXIT.                                            spswd01p
024200     EXIT.                                                        spswd01p
024300                                                                  spswd01p
024400***************************************************************** spswd01p
024500* NOOP Process                                                  * spswd01p
024600***************************************************************** spswd01p
024700 NOOP-PROCESS.                                                    spswd01p
024800     CONTINUE.                                                    spswd01p
024900 NOOP-PROCESS-EXIT.                                               spswd01p
025000     EXIT.                                                        spswd01p
025100                                                                  spswd01p
025200***************************************************************** spswd01p
025300* Write the log message                                         * spswd01p
025400***************************************************************** spswd01p
025500 DISPLAY-MSG.                                                     spswd01p
025600     MOVE 0 TO WS-MSG-LEN.                                        spswd01p
025700     INSPECT WS-MSG-DATA TALLYING WS-MSG-LEN                      spswd01p
025800       FOR CHARACTERS BEFORE '~'.                                 spswd01p
025900     EXEC CICS WRITE                                              spswd01p
026000               OPERATOR                                           spswd01p
026100               TEXT(WS-MSG-DATA)                                  spswd01p
026200               TEXTLENGTH(WS-MSG-LEN)                             spswd01p
026300     END-EXEC.                                                    spswd01p
026400                                                                  spswd01p
026500* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     spswd01p
