      * Generated on 7/9/2021 at 8:45:48 PM
      *
      *|COMPONENT INFO:
      *|Component type: Structure Based Slice: Range
      *|Original program: "BBANK10P"
      *|COBOL dialect: Cobol390

      *|COMPONENT TYPE SPECIFIC:
      *|Start Paragraph: VALIDATE-USER
      *|Last Paragraph: VALIDATE-USER

      *|THIS IS THE LAST LINE OF GENERATED HEADER

000100***************************************************************** bbank10p
000100*                                                               * bbank10p
000200*   Copyright (C) 1998-2021 Micro Focus. All Rights Reserved.   * bbank10p
000300*   This demonstration program is provided for use by users     * bbank10p
000400*   of Micro Focus products and may be used, modified and       * bbank10p
000500*   distributed as part of your application provided that       * bbank10p
000600*   you properly acknowledge the copyright of Micro Focus       * bbank10p
000700*   in this material.                                           * bbank10p
000800*                                                               * bbank10p
000900***************************************************************** bbank10p

001200***************************************************************** bbank10p
001200* Program:     BBANK10P.CBL                                     * bbank10p
001300* Layer:       Business logic                                   * bbank10p
001400* Function:    Signon to system to identify user                * bbank10p
001500***************************************************************** bbank10p
001600 IDENTIFICATION DIVISION.                                         bbank10p
       PROGRAM-ID. UserVal.

002600 ENVIRONMENT DIVISION.                                            bbank10p
002700                                                                  bbank10p
002800 DATA DIVISION.                                                   bbank10p
003000 WORKING-STORAGE SECTION.                                         bbank10p
003000 01 WS-MISC-STORAGE.                                              bbank10p
003100   05 WS-PROGRAM-ID PIC X(8) VALUE 'BBANK10P'.                    bbank10p
003200                                                                  bbank10p
003300   05 WS-INPUT-FLAG PIC X(1).                                     bbank10p
003400     88 INPUT-OK VALUE '0'.                                       bbank10p
003500     88 INPUT-ERROR VALUE '1'.                                    bbank10p
003600   05 WS-RETURN-FLAG PIC X(1).                                    bbank10p
003700     88 WS-RETURN-FLAG-OFF VALUE LOW-VALUES.                      bbank10p
003800     88 WS-RETURN-FLAG-ON VALUE '1'.                              bbank10p
003900   05 WS-RETURN-MSG PIC X(75).                                    bbank10p
004000     88 WS-RETURN-MSG-OFF VALUE SPACES.                           bbank10p
004100   05 WS-PFK-FLAG PIC X(1).                                       bbank10p
004200     88 PFK-VALID VALUE '0'.                                      bbank10p
004300     88 PFK-INVALID VALUE '1'.                                    bbank10p
004400   05 WS-ERROR-MSG PIC X(75).                                     bbank10p
004600 01 WS-BANK-DATA.                                                 bbank10p
004600                                                                  bbank10p
004700 COPY CBANKDAT.                                                   bbank10p
005200 01 WS-PERSON.                                                    bbank10p
005200                                                                  bbank10p
005300 COPY CBANKD01.                                                   bbank10p
005500 01 WS-SECURITY.                                                  bbank10p
005500                                                                  bbank10p
005600 COPY CPSWDD01.                                                   bbank10p
006000 LINKAGE SECTION.                                                 bbank10p
006000 01 DFHCOMMAREA.                                                  bbank10p
006200   05 LK-COMMAREA PIC X(6144).                                    bbank10p
       COPY 'REQUEST'.
       COPY 'RESPONSE'.
       
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
           GO TO VALIDATE-USER
           .
019200 VALIDATE-USER.                                                   bbank10p
019300     SET INPUT-OK TO TRUE
           .                                                            bbank10p
019400     INSPECT BANK-SIGNON-ID                                       bbank10p
019500       CONVERTING 'abcdefghijklmnopqrstuvwxyz'                    bbank10p
019600       TO 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
           .                                                            bbank10p
019700     IF BANK-SIGNON-ID IS EQUAL TO 'GUEST'                        bbank10p
019800         MOVE 'GUEST' TO BANK-USERID                              bbank10p
019900         MOVE 'Guest' TO BANK-USERID-NAME                         bbank10p
020000         GO TO VALIDATE-USER-EXIT                                 bbank10p
020100     END-IF
           .                                                            bbank10p
020200     IF BANK-SIGNON-ID IS EQUAL TO LOW-VALUES                     bbank10p
020300         MOVE 'Please input user id' TO WS-ERROR-MSG              bbank10p
020400         GO TO VALIDATE-USER-ERROR                                bbank10p
020500     END-IF
           .                                                            bbank10p
020600     IF BANK-PSWD IS EQUAL TO LOW-VALUES                          bbank10p
020700         MOVE 'Please input password' TO WS-ERROR-MSG             bbank10p
020800         GO TO VALIDATE-USER-ERROR                                bbank10p
020900     END-IF
           .                                                            bbank10p
021000* We now make sure the user is valid.......                       bbank10p
021000     MOVE SPACES TO CPSWDD01-DATA
           .                                                            bbank10p
021200     MOVE BANK-SIGNON-ID TO CPSWDD01I-USERID
           .                                                            bbank10p
021300     MOVE BANK-PSWD TO CPSWDD01I-PASSWORD                         bbank10p
021400* If user starts with "Z" then treat as "B"                       bbank10p
021500     IF CPSWDD01I-USERID(1:1) IS EQUAL TO 'Z'                     bbank10p
021600         MOVE 'B' TO CPSWDD01I-USERID(1:1)                        bbank10p
021700     END-IF
           .                                                            bbank10p
021900     SET PSWD-SIGNON TO TRUE                                      bbank10p
      *795
022100     COPY CPSWDX01.                                               bbank10p
022200     IF CPSWDD01O-MESSAGE IS NOT EQUAL TO SPACES                  bbank10p
022300         MOVE CPSWDD01O-MESSAGE TO WS-ERROR-MSG                   bbank10p
022400         GO TO VALIDATE-USER-ERROR                                bbank10p
022500     END-IF
           .                                                            bbank10p
022600* We now make sure the user is actually a customer......          bbank10p
022600     MOVE SPACES TO CD01-DATA
           .                                                            bbank10p
022800     MOVE BANK-SIGNON-ID TO CD01I-PERSON-PID
           .                                                            bbank10p
022900* If user starts with "Z" then treat as "B"                       bbank10p
022900     IF CD01I-PERSON-PID(1:1) IS EQUAL TO 'Z'                     bbank10p
023100         MOVE 'B' TO CD01I-PERSON-PID(1:1)                        bbank10p
023200     END-IF
           .                                                            bbank10p
023300     COPY CBANKX01.                                               bbank10p
023400     IF CD01O-PERSON-PID IS EQUAL TO SPACES                       bbank10p
023500         MOVE CD01O-PERSON-NAME TO WS-ERROR-MSG                   bbank10p
023600         GO TO VALIDATE-USER-ERROR                                bbank10p
023700     ELSE                                                         bbank10p
023800         MOVE CD01O-PERSON-NAME TO BANK-USERID-NAME               bbank10p
023900         MOVE BANK-SIGNON-ID TO BANK-USERID                       bbank10p
024000         IF BANK-USERID(1:1) IS EQUAL TO 'Z'                      bbank10p
024100             MOVE 'B' TO BANK-USERID(1:1)                         bbank10p
024200         END-IF                                                   bbank10p
024300         GO TO VALIDATE-USER-EXIT                                 bbank10p
024400     END-IF
           .                                                            bbank10p
024500 VALIDATE-USER-ERROR.                                             bbank10p
024600     SET INPUT-ERROR TO TRUE
           .                                                            bbank10p
024700 VALIDATE-USER-EXIT.                                              bbank10p
024700     PERFORM BRE-COPY-OUTPUT-DATA
           .                                                            bbank10p
024900                                                                  bbank10p
025000*                                                                 bbank10p
       BRE-EXIT-PROGRAM.
           GOBACK
           .
       BRE-COPY-INPUT-DATA-0.
           MOVE BRE-I-BANK-SIGNON-ID TO BANK-SIGNON-ID
           MOVE BRE-I-BANK-USERID TO BANK-USERID
           MOVE BRE-I-BANK-PSWD TO BANK-PSWD
           .
       BRE-COPY-OUTPUT-DATA.
           MOVE WS-INPUT-FLAG TO BRE-O-WS-INPUT-FLAG
           MOVE WS-ERROR-MSG TO BRE-O-WS-ERROR-MSG
           MOVE BANK-SIGNON-ID TO BRE-O-BANK-SIGNON-ID
           MOVE BANK-USERID TO BRE-O-BANK-USERID
           MOVE BANK-USERID-NAME TO BRE-O-BANK-USERID-NA.
