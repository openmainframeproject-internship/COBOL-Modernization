      * Generated on 7/9/2021 at 8:23:40 PM
      *
      *|COMPONENT INFO:
      *|Component type: Computation Based Slice
      *|Original program: "BBANK70P"
      *|COBOL dialect: Cobol390

      *|COMPONENT TYPE SPECIFIC:
      *|Requested component type is statement based
      *|\Users\Administrator\workspace\FullBankDemo\cbl\BBANK70P.CBL,
      *    238, 12.
      *|{Point.Name}

      *|THIS IS THE LAST LINE OF GENERATED HEADER

000100***************************************************************** bbank70p
000100*                                                               * bbank70p
000200*   Copyright (C) 1998-2021 Micro Focus. All Rights Reserved.   * bbank70p
000300*   This demonstration program is provided for use by users     * bbank70p
000400*   of Micro Focus products and may be used, modified and       * bbank70p
000500*   distributed as part of your application provided that       * bbank70p
000600*   you properly acknowledge the copyright of Micro Focus       * bbank70p
000700*   in this material.                                           * bbank70p
000800*                                                               * bbank70p
000900***************************************************************** bbank70p

001200***************************************************************** bbank70p
001200* Program:     BBANK70P.CBL                                     * bbank70p
001300* Layer:       Business logic                                   * bbank70p
001400* Function:    Calculate cost of loan                           * bbank70p
001500***************************************************************** bbank70p
001600 IDENTIFICATION DIVISION.                                         bbank70p
       PROGRAM-ID. CalcLoan.

002600 ENVIRONMENT DIVISION.                                            bbank70p
002700                                                                  bbank70p
002800 DATA DIVISION.                                                   bbank70p
003000 WORKING-STORAGE SECTION.                                         bbank70p
003000 01 WS-MISC-STORAGE.                                              bbank70p
003100   05 WS-PROGRAM-ID PIC X(8) VALUE 'BBANK70P'.                    bbank70p
003200                                                                  bbank70p
003300   05 WS-INPUT-FLAG PIC X(1).                                     bbank70p
003400     88 INPUT-OK VALUE '0'.                                       bbank70p
003500     88 INPUT-ERROR VALUE '1'.                                    bbank70p
003600   05 WS-RETURN-FLAG PIC X(1).                                    bbank70p
003700     88 WS-RETURN-FLAG-OFF VALUE LOW-VALUES.                      bbank70p
003800     88 WS-RETURN-FLAG-ON VALUE '1'.                              bbank70p
003900   05 WS-RETURN-MSG PIC X(75).                                    bbank70p
004000     88 WS-RETURN-MSG-OFF VALUE SPACES.                           bbank70p
004100   05 WS-PFK-FLAG PIC X(1).                                       bbank70p
004200     88 PFK-VALID VALUE '0'.                                      bbank70p
004300     88 PFK-INVALID VALUE '1'.                                    bbank70p
004500*                                                                 bbank70p
004600   05 WS-CALC-WORK-AREAS.                                         bbank70p
004700* Used to count no of periods in rate                             bbank70p
004800     10 WS-CALC-WORK-RATE-PERIOD PIC 9(1).                        bbank70p
004900* Generate work area                                              bbank70p
005000     10 WS-CALC-WORK-TEMP PIC X(7).                               bbank70p
005100* Work area for AMOUNT                                            bbank70p
005200     10 WS-CALC-WORK-AMOUNT PIC X(7).                             bbank70p
005300     10 WS-CALC-WORK-AMOUNT-N REDEFINES WS-CALC-WORK-AMOUNT       bbank70p
                                    PIC 9(7).
005500* Work area for RATE                                              bbank70p
005600     10 WS-CALC-WORK-RATE PIC X(7).                               bbank70p
005700* Used to hold first part of rate (before the period)             bbank70p
005800     10 WS-CALC-WORK-RATE-P1 PIC X(6).                            bbank70p
005900     10 WS-CALC-WORK-RATE-P1-N REDEFINES WS-CALC-WORK-RATE-P1     bbank70p
                                     PIC 9(6).
006100* Used to hold second part of rate (before the period)            bbank70p
006200     10 WS-CALC-WORK-RATE-P2 PIC X(6).                            bbank70p
006300     10 WS-CALC-WORK-RATE-P2-N REDEFINES WS-CALC-WORK-RATE-P2     bbank70p
                                     PIC 9(6).
006500* Used to hold rate as percentage (xxxvxxx)                       bbank70p
006600     10 WS-CALC-WORK-PERC PIC X(6).                               bbank70p
006700     10 WS-CALC-WORK-PERC-N REDEFINES WS-CALC-WORK-PERC           bbank70p
                                  PIC 9(3)V9(3).
006900* Work area for TERM                                              bbank70p
007000     10 WS-CALC-WORK-TERM PIC X(5).                               bbank70p
007100     10 WS-CALC-WORK-TERM-N REDEFINES WS-CALC-WORK-TERM PIC 9(5). bbank70p
007300* Work area for PAYMENT                                           bbank70p
007400     10 WS-CALC-WORK-PAYMENT PIC X(9).                            bbank70p
007500     10 WS-CALC-WORK-PAYMENT-N REDEFINES WS-CALC-WORK-PAYMENT     bbank70p
                                     PIC $$$$$9.99.
007700                                                                  bbank70p
007800   05 WS-LOAN-AREAS.                                              bbank70p
007900     10 WS-LOAN-PRINCIPAL PIC S9(7).                              bbank70p
008000     10 WS-LOAN-INTEREST PIC SV9(8).                              bbank70p
008100     10 WS-LOAN-TERM PIC S9(5).                                   bbank70p
008200     10 WS-LOAN-MONTHLY-PAYMENT PIC S9(6)V99.                     bbank70p
008400* 01 WS-BANK-DATA.                                                bbank70p
008400                                                                  bbank70p
009200 LINKAGE SECTION.                                                 bbank70p
       01 AMOUNT PIC X(7).
       01 RATE PIC X(7).
       01 TERM PIC X(5).
       01 PAYMENT PIC X(9).
       01 ERROR-MSG PIC X(75).
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
001300 PROCEDURE DIVISION USING AMOUNT, RATE, TERM, PAYMENT, ERROR-MSG. centry
001500                                                                  centry
001600* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     centry
009600                                                                  bbank70p
009700***************************************************************** bbank70p
009800* Make ourselves re-entrant                                     * bbank70p
009900***************************************************************** bbank70p
010000                                                                  bbank70p
010200***************************************************************** bbank70p
010200* Move the passed area to Bour area                              *bbank70p
010300***************************************************************** bbank70p
010400*    MOVE DFHCOMMAREA(1:LENGTH OF WS-BANK-DATA) TO WS-BANK-DATA.  bbank70p

020600     DISPLAY AMOUNT.                                              bbank70p
           DISPLAY RATE.
           DISPLAY TERM.
            
020700     PERFORM VALIDATE-DATA THRU                                   bbank70p
             VALIDATE-DATA-EXIT
020800     .                                                            bbank70p
021000* If we had an error display error and return                     bbank70p
021000     IF INPUT-ERROR                                               bbank70p
               GO TO BRE-EXIT-PROGRAM
022100     END-IF
           .                                                            bbank70p
022300* Now calculate the monthly cost of the loan                      bbank70p
022300     MOVE WS-CALC-WORK-AMOUNT-N TO WS-LOAN-PRINCIPAL
           .                                                            bbank70p
022500     DIVIDE 100 INTO WS-CALC-WORK-PERC-N                          bbank70p
022600       GIVING WS-LOAN-INTEREST
           .                                                            bbank70p
022700     MOVE WS-CALC-WORK-TERM-N TO WS-LOAN-TERM
           .                                                            bbank70p
023000     DIVIDE WS-LOAN-INTEREST BY 12                                bbank70p
023100       GIVING WS-LOAN-INTEREST ROUNDED
           .                                                            bbank70p
023200     COMPUTE WS-LOAN-MONTHLY-PAYMENT ROUNDED =                    bbank70p
023300       ((WS-LOAN-INTEREST * ((1 + WS-LOAN-INTEREST)               bbank70p
             ** WS-LOAN-TERM)) /
023400                                                                  bbank70p
023500       (((1 + WS-LOAN-INTEREST) ** WS-LOAN-TERM) - 1))            bbank70p
             * WS-LOAN-PRINCIPAL
023600     .                                                            bbank70p
023700     MOVE WS-LOAN-MONTHLY-PAYMENT TO WS-CALC-WORK-PAYMENT-N
           .                                                            bbank70p
023800                                                                  bbank70p
      *Statement of interest
023800     MOVE WS-CALC-WORK-PAYMENT TO PAYMENT
           .
           DISPLAY WS-LOAN-MONTHLY-PAYMENT.                             bbank70p
           DISPLAY WS-CALC-WORK-PAYMENT-N.
           DISPLAY WS-CALC-WORK-PAYMENT.
           DISPLAY PAYMENT.
           GO TO BRE-EXIT-PROGRAM
           .
025300 VALIDATE-DATA.                                                   bbank70p
025400     SET INPUT-OK TO TRUE
           .                                                            bbank70p
025500                                                                  bbank70p
025600     MOVE AMOUNT TO WS-CALC-WORK-AMOUNT
           .                                                            bbank70p
025700     PERFORM VALIDATE-AMOUNT THRU                                 bbank70p
             VALIDATE-AMOUNT-EXIT
025800     .                                                            bbank70p
025900     IF NOT INPUT-OK                                              bbank70p
026000         GO TO VALIDATE-DATA-ERROR                                bbank70p
026100     END-IF
           .                                                            bbank70p
026200                                                                  bbank70p
026300     MOVE RATE TO WS-CALC-WORK-RATE
           .                                                            bbank70p
026400     PERFORM VALIDATE-RATE THRU                                   bbank70p
             VALIDATE-RATE-EXIT
026500     .                                                            bbank70p
026600     IF NOT INPUT-OK                                              bbank70p
026700         GO TO VALIDATE-DATA-ERROR                                bbank70p
026800     END-IF
           .                                                            bbank70p
026900                                                                  bbank70p
027000     MOVE TERM TO WS-CALC-WORK-TERM
           .                                                            bbank70p
027100     PERFORM VALIDATE-TERM THRU                                   bbank70p
             VALIDATE-TERM-EXIT
027200     .                                                            bbank70p
027300     IF NOT INPUT-OK                                              bbank70p
027400         GO TO VALIDATE-DATA-ERROR                                bbank70p
027500     END-IF
           .                                                            bbank70p
027600                                                                  bbank70p
027700     GO TO VALIDATE-DATA-EXIT
           .                                                            bbank70p
027800                                                                  bbank70p
027900 VALIDATE-DATA-ERROR.                                             bbank70p
028000     SET INPUT-ERROR TO TRUE
           .                                                            bbank70p
028100 VALIDATE-DATA-EXIT.                                              bbank70p
028100     EXIT
           .                                                            bbank70p
028300                                                                  bbank70p
028400 VALIDATE-AMOUNT.                                                 bbank70p
028500     CONTINUE
           .                                                            bbank70p
028600 VALIDATE-AMOUNT-RIGHT-JUSTIFY.                                   bbank70p
028600     IF WS-CALC-WORK-AMOUNT IS EQUAL TO SPACES OR                 bbank70p
             WS-CALC-WORK-AMOUNT IS EQUAL TO LOW-VALUES
028800                                                                  bbank70p
028900         MOVE 'Please enter an amount'                            bbank70p
029000           TO ERROR-MSG                                           bbank70p
029100         GO TO VALIDATE-AMOUNT-ERROR                              bbank70p
029200     END-IF
           .                                                            bbank70p
029300     IF WS-CALC-WORK-AMOUNT(7:1) IS EQUAL TO SPACES OR            bbank70p
             WS-CALC-WORK-AMOUNT(7:1) IS EQUAL TO LOW-VALUE
029400                                                                  bbank70p
029500         MOVE WS-CALC-WORK-AMOUNT(1:6) TO WS-CALC-WORK-TEMP       bbank70p
029600         MOVE SPACES TO WS-CALC-WORK-AMOUNT                       bbank70p
029700         MOVE WS-CALC-WORK-TEMP(1:6) TO WS-CALC-WORK-AMOUNT(2:6)  bbank70p
029800         GO TO VALIDATE-AMOUNT-RIGHT-JUSTIFY                      bbank70p
029900     END-IF
           .                                                            bbank70p
030000     INSPECT WS-CALC-WORK-AMOUNT                                  bbank70p
030100       REPLACING LEADING SPACES BY ZEROS
           .                                                            bbank70p
030200     IF WS-CALC-WORK-AMOUNT IS NOT NUMERIC                        bbank70p
030300         MOVE 'Amount is invalid (not numeric)'                   bbank70p
030400           TO ERROR-MSG                                           bbank70p
030500         GO TO VALIDATE-AMOUNT-ERROR                              bbank70p
030600     END-IF
           .                                                            bbank70p
030700     IF WS-CALC-WORK-AMOUNT IS EQUAL TO ZERO                      bbank70p
030800         MOVE 'Please enter a non-zero amount'                    bbank70p
030900           TO ERROR-MSG                                           bbank70p
031000         GO TO VALIDATE-AMOUNT-ERROR                              bbank70p
031100     END-IF
           .                                                            bbank70p
031200                                                                  bbank70p
031300     GO TO VALIDATE-AMOUNT-EXIT
           .                                                            bbank70p
031400                                                                  bbank70p
031500 VALIDATE-AMOUNT-ERROR.                                           bbank70p
031600     SET INPUT-ERROR TO TRUE
           .                                                            bbank70p
031700 VALIDATE-AMOUNT-EXIT.                                            bbank70p
031700     EXIT
           .                                                            bbank70p
031900                                                                  bbank70p
032000 VALIDATE-RATE.                                                   bbank70p
032100     CONTINUE
           .                                                            bbank70p
032200 VALIDATE-RATE-RIGHT-JUSTIFY.                                     bbank70p
032200     IF WS-CALC-WORK-RATE IS EQUAL TO SPACES OR                   bbank70p
             WS-CALC-WORK-RATE IS EQUAL TO LOW-VALUES
032400                                                                  bbank70p
032500         MOVE 'Please enter an interest rate in the form 999.999' bbank70p
032600           TO ERROR-MSG                                           bbank70p
032700         GO TO VALIDATE-RATE-ERROR                                bbank70p
032800     END-IF
           .                                                            bbank70p
032900     IF WS-CALC-WORK-RATE(7:1) IS EQUAL TO SPACES OR              bbank70p
             WS-CALC-WORK-RATE(7:1) IS EQUAL TO LOW-VALUE
033000                                                                  bbank70p
033100         MOVE WS-CALC-WORK-RATE(1:6) TO WS-CALC-WORK-TEMP         bbank70p
033200         MOVE SPACES TO WS-CALC-WORK-RATE                         bbank70p
033300         MOVE WS-CALC-WORK-TEMP(1:6) TO WS-CALC-WORK-RATE(2:6)    bbank70p
033400         GO TO VALIDATE-RATE-RIGHT-JUSTIFY                        bbank70p
033500     END-IF
           .                                                            bbank70p
033600     INSPECT WS-CALC-WORK-RATE REPLACING LEADING SPACES BY ZERO
           .                                                            bbank70p
033700     MOVE ZERO TO WS-CALC-WORK-RATE-PERIOD
           .                                                            bbank70p
033800     MOVE ZEROS TO WS-CALC-WORK-RATE-P1
           .                                                            bbank70p
033900     MOVE ZEROS TO WS-CALC-WORK-RATE-P2
           .                                                            bbank70p
034000* Rate is in form .xxxxxx                                         bbank70p
034000     IF WS-CALC-WORK-RATE(1:1) IS EQUAL TO '.'                    bbank70p
034200         MOVE ZEROS TO WS-CALC-WORK-RATE-P1                       bbank70p
034300         MOVE WS-CALC-WORK-RATE(2:6) TO WS-CALC-WORK-RATE-P2(1:6) bbank70p
034400         ADD 1 TO WS-CALC-WORK-RATE-PERIOD                        bbank70p
034500     END-IF
           .                                                            bbank70p
034600* Rate is in form x.xxxxx                                         bbank70p
034600     IF WS-CALC-WORK-RATE(2:1) IS EQUAL TO '.'                    bbank70p
034800         MOVE WS-CALC-WORK-RATE(1:1) TO WS-CALC-WORK-RATE-P1(6:1) bbank70p
034900         MOVE WS-CALC-WORK-RATE(3:5) TO WS-CALC-WORK-RATE-P2(1:5) bbank70p
035000         ADD 1 TO WS-CALC-WORK-RATE-PERIOD                        bbank70p
035100     END-IF
           .                                                            bbank70p
035200* Rate is in form xx.xxxx                                         bbank70p
035200     IF WS-CALC-WORK-RATE(3:1) IS EQUAL TO '.'                    bbank70p
035400         MOVE WS-CALC-WORK-RATE(1:2) TO WS-CALC-WORK-RATE-P1(5:2) bbank70p
035500         MOVE WS-CALC-WORK-RATE(4:4) TO WS-CALC-WORK-RATE-P2(1:4) bbank70p
035600         ADD 1 TO WS-CALC-WORK-RATE-PERIOD                        bbank70p
035700     END-IF
           .                                                            bbank70p
035800* Rate is in form xxx.xxx                                         bbank70p
035800     IF WS-CALC-WORK-RATE(4:1) IS EQUAL TO '.'                    bbank70p
036000         MOVE WS-CALC-WORK-RATE(1:3) TO WS-CALC-WORK-RATE-P1(4:3) bbank70p
036100         MOVE WS-CALC-WORK-RATE(5:3) TO WS-CALC-WORK-RATE-P2(1:3) bbank70p
036200         ADD 1 TO WS-CALC-WORK-RATE-PERIOD                        bbank70p
036300     END-IF
           .                                                            bbank70p
036400* Rate is in form xxxx.xx                                         bbank70p
036400     IF WS-CALC-WORK-RATE(5:1) IS EQUAL TO '.'                    bbank70p
036600         MOVE WS-CALC-WORK-RATE(1:4) TO WS-CALC-WORK-RATE-P1(3:4) bbank70p
036700         MOVE WS-CALC-WORK-RATE(6:2) TO WS-CALC-WORK-RATE-P2(1:2) bbank70p
036800         ADD 1 TO WS-CALC-WORK-RATE-PERIOD                        bbank70p
036900     END-IF
           .                                                            bbank70p
037000* Rate is in form xxxxx.x                                         bbank70p
037000     IF WS-CALC-WORK-RATE(6:1) IS EQUAL TO '.'                    bbank70p
037200         MOVE WS-CALC-WORK-RATE(1:5) TO WS-CALC-WORK-RATE-P1(2:5) bbank70p
037300         MOVE WS-CALC-WORK-RATE(7:1) TO WS-CALC-WORK-RATE-P2(1:1) bbank70p
037400         ADD 1 TO WS-CALC-WORK-RATE-PERIOD                        bbank70p
037500     END-IF
           .                                                            bbank70p
037600* Rate is in form xxxxxx.                                         bbank70p
037600     IF WS-CALC-WORK-RATE(7:1) IS EQUAL TO '.'                    bbank70p
037800         MOVE WS-CALC-WORK-RATE(1:6) TO WS-CALC-WORK-RATE-P1(1:6) bbank70p
037900         MOVE ZEROS TO WS-CALC-WORK-RATE-P2(1:1)                  bbank70p
038000         ADD 1 TO WS-CALC-WORK-RATE-PERIOD                        bbank70p
038100     END-IF
           .                                                            bbank70p
038200     IF WS-CALC-WORK-RATE-PERIOD IS NOT EQUAL TO 1                bbank70p
038300         MOVE 'Decimal point missing/misplaced in interest rate'  bbank70p
038400           TO ERROR-MSG                                           bbank70p
038500         GO TO VALIDATE-RATE-ERROR                                bbank70p
038600     END-IF
           .                                                            bbank70p
038700     IF WS-CALC-WORK-RATE-P1 IS NOT NUMERIC OR                    bbank70p
             WS-CALC-WORK-RATE-P2 IS NOT NUMERIC
038800                                                                  bbank70p
038900         MOVE 'Rate is not numeric'                               bbank70p
039000           TO ERROR-MSG                                           bbank70p
039100         GO TO VALIDATE-RATE-ERROR                                bbank70p
039200     END-IF
           .                                                            bbank70p
039300     IF WS-CALC-WORK-RATE-P2(4:3) IS NOT EQUAL TO '000'           bbank70p
039400         MOVE 'Rate has too many decimal places'                  bbank70p
039500           TO ERROR-MSG                                           bbank70p
039600         GO TO VALIDATE-RATE-ERROR                                bbank70p
039700     END-IF
           .                                                            bbank70p
039800* Bring parts of rate together with no physical decimal point     bbank70p
039800     MOVE WS-CALC-WORK-RATE-P1(4:3) TO WS-CALC-WORK-PERC(1:3)
           .                                                            bbank70p
040000     MOVE WS-CALC-WORK-RATE-P2(1:3) TO WS-CALC-WORK-PERC(4:3)
           .                                                            bbank70p
040100                                                                  bbank70p
040200     IF WS-CALC-WORK-PERC-N IS NOT GREATER THAN ZERO              bbank70p
040300         MOVE 'Nothing''s free. Rate must be greater than 0%'     bbank70p
040400           TO ERROR-MSG                                           bbank70p
040500         GO TO VALIDATE-RATE-ERROR                                bbank70p
040600     END-IF
           .                                                            bbank70p
040700     IF WS-CALC-WORK-PERC-N IS NOT LESS THAN 100.000              bbank70p
040800         MOVE 'Outrageous rate - 100% or more'                    bbank70p
040900           TO ERROR-MSG                                           bbank70p
041000         GO TO VALIDATE-RATE-ERROR                                bbank70p
041100     END-IF
           .                                                            bbank70p
041200                                                                  bbank70p
041300     GO TO VALIDATE-RATE-EXIT
           .                                                            bbank70p
041400                                                                  bbank70p
041500 VALIDATE-RATE-ERROR.                                             bbank70p
041600     SET INPUT-ERROR TO TRUE
           .                                                            bbank70p
041700 VALIDATE-RATE-EXIT.                                              bbank70p
041700     EXIT
           .                                                            bbank70p
041900                                                                  bbank70p
042000 VALIDATE-TERM.                                                   bbank70p
042100     CONTINUE
           .                                                            bbank70p
042200 VALIDATE-TERM-RIGHT-JUSTIFY.                                     bbank70p
042200     IF WS-CALC-WORK-TERM IS EQUAL TO SPACES OR                   bbank70p
             WS-CALC-WORK-TERM IS EQUAL TO LOW-VALUES
042400                                                                  bbank70p
042500         MOVE 'Please enter a term as a number of months'         bbank70p
042600           TO ERROR-MSG                                           bbank70p
042700         GO TO VALIDATE-TERM-ERROR                                bbank70p
042800     END-IF
           .                                                            bbank70p
042900     IF WS-CALC-WORK-TERM(5:1) IS EQUAL TO SPACES OR              bbank70p
             WS-CALC-WORK-TERM(5:1) IS EQUAL TO LOW-VALUE
043000                                                                  bbank70p
043100         MOVE WS-CALC-WORK-TERM(1:4) TO WS-CALC-WORK-TEMP         bbank70p
043200         MOVE SPACES TO WS-CALC-WORK-TERM                         bbank70p
043300         MOVE WS-CALC-WORK-TEMP(1:4) TO WS-CALC-WORK-TERM(2:4)    bbank70p
043400         GO TO VALIDATE-TERM-RIGHT-JUSTIFY                        bbank70p
043500     END-IF
           .                                                            bbank70p
043600     INSPECT WS-CALC-WORK-TERM                                    bbank70p
043700       REPLACING LEADING SPACES BY ZEROS
           .                                                            bbank70p
043800     IF WS-CALC-WORK-TERM IS NOT NUMERIC                          bbank70p
043900         MOVE 'Term is invalid (not numeric)'                     bbank70p
044000           TO ERROR-MSG                                           bbank70p
044100         GO TO VALIDATE-TERM-ERROR                                bbank70p
044200     END-IF
           .                                                            bbank70p
044300     IF WS-CALC-WORK-TERM IS EQUAL TO ZERO                        bbank70p
044400         MOVE 'Please enter a non-zero term'                      bbank70p
044500           TO ERROR-MSG                                           bbank70p
044600         GO TO VALIDATE-TERM-ERROR                                bbank70p
044700     END-IF
           .                                                            bbank70p
044800     IF WS-CALC-WORK-TERM-N IS GREATER THAN 1200                  bbank70p
044900         MOVE 'Term exceeds 100 years!'                           bbank70p
045000           TO ERROR-MSG                                           bbank70p
045100         GO TO VALIDATE-TERM-ERROR                                bbank70p
045200     END-IF
           .                                                            bbank70p
045300                                                                  bbank70p
045400     GO TO VALIDATE-TERM-EXIT
           .                                                            bbank70p
045500                                                                  bbank70p
045600 VALIDATE-TERM-ERROR.                                             bbank70p
045700     SET INPUT-ERROR TO TRUE
           .                                                            bbank70p
045800 VALIDATE-TERM-EXIT.                                              bbank70p
045800     EXIT
           .                                                            bbank70p
046000                                                                  bbank70p
046100*                                                                 bbank70p
       BRE-EXIT-PROGRAM.
           DISPLAY ERROR-MSG.
           GOBACK
           .
