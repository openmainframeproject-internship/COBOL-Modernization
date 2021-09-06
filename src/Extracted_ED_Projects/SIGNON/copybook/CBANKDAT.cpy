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
000700***************************************************************** cbankdat
000800* CBANKDAT.CPY                                                  * cbankdat
000900*---------------------------------------------------------------* cbankdat
001000* Common data passed between the major components               * cbankdat
001100***************************************************************** cbankdat
001200     10  BANK-EVERYTHING                     PIC X(6144).         cbankdat
001300*    10  FILLER REDEFINES BANK-EVERYTHING.                        cbankdat
001400     10  BANK-EVERYTHING-R REDEFINES BANK-EVERYTHING.             cbankdat
001500       15  BANK-PREFIX                       PIC X(22).           cbankdat
001600       15  BANK-IMS-PREFIX REDEFINES BANK-PREFIX.                 cbankdat
001700         20  BANK-IMS-SPA-LL                 PIC S9(8) COMP.      cbankdat
001800         20  BANK-IMS-SPA-ZZ                 PIC X(2).            cbankdat
001900         20  BANK-IMS-SPA-TRANCODE           PIC X(8).            cbankdat
002000         20  BANK-IMS-SPA-PASSED-DATA        PIC X(8).            cbankdat
002100         20  BANK-IMS-SPA-PASSED-DATA-R1 REDEFINES                cbankdat
002200             BANK-IMS-SPA-PASSED-DATA.                            cbankdat
002300           25  BANK-IMS-IO-PCB-DATE          PIC S9(7) COMP-3.    cbankdat
002400           25  BANK-IMS-IO-PCB-TIME          PIC S9(7) COMP-3.    cbankdat
002500         20  BANK-IMS-SPA-PASSED-DATA-R2 REDEFINES                cbankdat
002600             BANK-IMS-SPA-PASSED-DATA.                            cbankdat
002700           25  BANK-IMS-SPA-PASSED-LITERAL   PIC X(7).            cbankdat
002800           25  BANK-IMS-SPA-PASSED-COLOUR    PIC X(1).            cbankdat
002900       15  BANK-CICS-PREFIX REDEFINES BANK-PREFIX.                cbankdat
003000         20  BANK-CICS-LL                    PIC S9(4) COMP.      cbankdat
003100         20  FILLER                          PIC X(4).            cbankdat
003200         20  BANK-CICS-TRANCODE-PLUS4        PIC X(8).            cbankdat
003300         20  FILLER REDEFINES BANK-CICS-TRANCODE-PLUS4.           cbankdat
003400           25  BANK-CICS-TRANCODE            PIC X(4).            cbankdat
003500           25  FILLER                        PIC X(4).            cbankdat
003600       15  BANK-CONTROL-FIELDS.                                   cbankdat
003700         20  BANK-ENV                        PIC X(4).            cbankdat
003800           88  BANK-ENV-NULL                 VALUE LOW-VALUES.    cbankdat
003900           88  BANK-ENV-CICS                 VALUE 'CICS'.        cbankdat
004000           88  BANK-ENV-IMS                  VALUE 'IMS '.        cbankdat
004100           88  BANK-ENV-INET                 VALUE 'INET'.        cbankdat
004200         20  BANK-COLOUR-SETTING             PIC X(1).            cbankdat
004300           88  COLOUR-ON                     VALUE '1'.           cbankdat
004400           88  COLOUR-OFF                    VALUE '0'.           cbankdat
004500         20  BANK-CONVERSATION               PIC X(1).            cbankdat
004600           88  BANK-NO-CONV-IN-PROGRESS      VALUE '0'.           cbankdat
004700           88  BANK-CONV-IN-PROGRESS         VALUE '1'.           cbankdat
004800         20  BANK-TS-QUEUE-NAME              PIC X(8).            cbankdat
004900         20  BANK-AID                        PIC X(5).            cbankdat
005000           88  BANK-AID-ENTER                VALUE 'ENTER'.       cbankdat
005100           88  BANK-AID-CLEAR                VALUE 'CLEAR'.       cbankdat
005200           88  BANK-AID-PA1                  VALUE 'PA1  '.       cbankdat
005300           88  BANK-AID-PA2                  VALUE 'PA2  '.       cbankdat
005400           88  BANK-AID-PFK01                VALUE 'PFK01'.       cbankdat
005500           88  BANK-AID-PFK02                VALUE 'PFK02'.       cbankdat
005600           88  BANK-AID-PFK03                VALUE 'PFK03'.       cbankdat
005700           88  BANK-AID-PFK04                VALUE 'PFK04'.       cbankdat
005800           88  BANK-AID-PFK05                VALUE 'PFK05'.       cbankdat
005900           88  BANK-AID-PFK06                VALUE 'PFK06'.       cbankdat
006000           88  BANK-AID-PFK07                VALUE 'PFK07'.       cbankdat
006100           88  BANK-AID-PFK08                VALUE 'PFK08'.       cbankdat
006200           88  BANK-AID-PFK09                VALUE 'PFK09'.       cbankdat
006300           88  BANK-AID-PFK10                VALUE 'PFK10'.       cbankdat
006400           88  BANK-AID-PFK11                VALUE 'PFK11'.       cbankdat
006500           88  BANK-AID-PFK12                VALUE 'PFK12'.       cbankdat
006600         20  BANK-LAST-PROG                  PIC X(8).            cbankdat
006700         20  BANK-NEXT-PROG                  PIC X(8).            cbankdat
006800         20  BANK-RETURN-TO-PROG             PIC X(8).            cbankdat
006900         20  BANK-LAST-MAPSET                PIC X(7).            cbankdat
007000         20  BANK-LAST-MAP                   PIC X(7).            cbankdat
007100         20  BANK-NEXT-MAPSET                PIC X(7).            cbankdat
007200         20  BANK-NEXT-MAP                   PIC X(7).            cbankdat
007300         20  BANK-MAP-FUNCTION               PIC X(3).            cbankdat
007400           88  BANK-MAP-FUNCTION-GET         VALUE 'GET'.         cbankdat
007500           88  BANK-MAP-FUNCTION-PUT         VALUE 'PUT'.         cbankdat
007600         20  BANK-HELP-FIELDS.                                    cbankdat
007700           25  BANK-HELP-FLAG                PIC X(4).            cbankdat
007800             88  BANK-HELP-ACTIVE            VALUE 'HELP'.        cbankdat
007900             88  BANK-HELP-INACTIVE          VALUE LOW-VALUES.    cbankdat
008000           25  BANK-HELP-SCREEN              PIC 9(2).            cbankdat
008100         20  BANK-PAGING-FIELDS.                                  cbankdat
008200           25  BANK-PAGING-STATUS            PIC X(1).            cbankdat
008300             88  BANK-PAGING-OFF             VALUE LOW-VALUES.    cbankdat
008400             88  BANK-PAGING-FIRST           VALUE '1'.           cbankdat
008500             88  BANK-PAGING-MIDDLE          VALUE '2'.           cbankdat
008600             88  BANK-PAGING-LAST            VALUE '3'.           cbankdat
008700           25  BANK-PAGING-FIRST-ENTRY       PIC X(26).           cbankdat
008800           25  BANK-PAGING-LAST-ENTRY        PIC X(26).           cbankdat
008900         20  BANK-RETURN-FLAG                PIC X(1).            cbankdat
009000           88  BANK-RETURN-FLAG-OFF          VALUE LOW-VALUES.    cbankdat
009100           88  BANK-RETURN-FLAG-ON           VALUE '1'.           cbankdat
009200         20  BANK-RETURN-MSG                 PIC X(75).           cbankdat
009300           88  BANK-RETURN-MSG-OFF           VALUE LOW-VALUES.    cbankdat
009400       15  BANK-ERROR-MSG                    PIC X(75).           cbankdat
009500       15  BANK-USER-DETAILS.                                     cbankdat
009600         20  BANK-SIGNON-ID                  PIC X(5).            cbankdat
009700         20  FILLER REDEFINES BANK-SIGNON-ID.                     cbankdat
009800           25  BANK-SIGNON-ID-1              PIC X(1).            cbankdat
009900             88  PROBLEM-USER                VALUE 'Z'.           cbankdat
010000           25  BANK-SIGNON-ID-2-5            PIC X(4).            cbankdat
010100         20  BANK-USERID                     PIC X(5).            cbankdat
010200           88  GUEST                         VALUE 'GUEST'.       cbankdat
010300         20  BANK-USERID-NAME                PIC X(25).           cbankdat
010400         20  BANK-PSWD                       PIC X(8).            cbankdat
010500       15  BANK-HELP-DATA.                                        cbankdat
010600         20  BANK-HELP-SCRN                  PIC X(6).            cbankdat
010700         20  BANK-HELP-STATUS                PIC X(1).            cbankdat
010800           88 BANK-HELP-FOUND                VALUE 'Y'.           cbankdat
010900           88 BANK-HELP-NOT-FOUND            VALUE 'N'.           cbankdat
011000         20  BANK-HELP-LINE                  PIC X(75)            cbankdat
011100             OCCURS 19 TIMES.                                     cbankdat
011200       15  BANK-SCREEN-DATA.                                      cbankdat
011300         20  BANK-SCREEN10-DATA.                                  cbankdat
011400           25  FILLER                        PIC X(1).            cbankdat
011500         20  BANK-SCREEN20-DATA.                                  cbankdat
011600           25  BANK-SCR20-SEL1ID             PIC X(1).            cbankdat
011700           25  BANK-SCR20-SEL1IP             PIC X(1).            cbankdat
011800           25  BANK-SCR20-SEL1TX             PIC X(40).           cbankdat
011900           25  BANK-SCR20-SEL2ID             PIC X(1).            cbankdat
012000           25  BANK-SCR20-SEL2IP             PIC X(1).            cbankdat
012100           25  BANK-SCR20-SEL2TX             PIC X(40).           cbankdat
012200           25  BANK-SCR20-SEL3ID             PIC X(1).            cbankdat
012300           25  BANK-SCR20-SEL3IP             PIC X(1).            cbankdat
012400           25  BANK-SCR20-SEL3TX             PIC X(40).           cbankdat
012500           25  BANK-SCR20-SEL4ID             PIC X(1).            cbankdat
012600           25  BANK-SCR20-SEL4IP             PIC X(1).            cbankdat
012700           25  BANK-SCR20-SEL4TX             PIC X(40).           cbankdat
012800           25  BANK-SCR20-SEL5ID             PIC X(1).            cbankdat
012900           25  BANK-SCR20-SEL5IP             PIC X(1).            cbankdat
013000           25  BANK-SCR20-SEL5TX             PIC X(40).           cbankdat
013100           25  BANK-SCR20-SEL6ID             PIC X(1).            cbankdat
013200           25  BANK-SCR20-SEL6IP             PIC X(1).            cbankdat
013300           25  BANK-SCR20-SEL6TX             PIC X(40).           cbankdat
013400           25  BANK-SCR20-SEL7ID             PIC X(1).            cbankdat
013500           25  BANK-SCR20-SEL7IP             PIC X(1).            cbankdat
013600           25  BANK-SCR20-SEL7TX             PIC X(40).           cbankdat
013700         20  BANK-SCREEN20-DATA-R REDEFINES BANK-SCREEN20-DATA.   cbankdat
013800           25  BANK-SCREEN20-FIELD           OCCURS 7 TIMES.      cbankdat
013900             30  BANK-SCR20-ID               PIC X(1).            cbankdat
014000             30  BANK-SCR20-IP               PIC X(1).            cbankdat
014100             30  BANK-SCR20-TX               PIC X(40).           cbankdat
014200         20  BANK-SCREEN30-DATA.                                  cbankdat
014300           25  BANK-SCR30-DET1               PIC X(1).            cbankdat
014400           25  BANK-SCR30-ACC1               PIC X(9).            cbankdat
014500           25  BANK-SCR30-DSC1               PIC X(15).           cbankdat
014600           25  BANK-SCR30-BAL1               PIC X(13).           cbankdat
014700           25  BANK-SCR30-SRV1               PIC X(6).            cbankdat
014800           25  BANK-SCR30-DTE1               PIC X(11).           cbankdat
014900           25  BANK-SCR30-TXN1               PIC X(1).            cbankdat
015000           25  BANK-SCR30-DET2               PIC X(1).            cbankdat
015100           25  BANK-SCR30-ACC2               PIC X(9).            cbankdat
015200           25  BANK-SCR30-DSC2               PIC X(15).           cbankdat
015300           25  BANK-SCR30-BAL2               PIC X(13).           cbankdat
015400           25  BANK-SCR30-SRV2               PIC X(6).            cbankdat
015500           25  BANK-SCR30-DTE2               PIC X(11).           cbankdat
015600           25  BANK-SCR30-TXN2               PIC X(1).            cbankdat
015700           25  BANK-SCR30-DET3               PIC X(1).            cbankdat
015800           25  BANK-SCR30-ACC3               PIC X(9).            cbankdat
015900           25  BANK-SCR30-DSC3               PIC X(15).           cbankdat
016000           25  BANK-SCR30-BAL3               PIC X(13).           cbankdat
016100           25  BANK-SCR30-SRV3               PIC X(6).            cbankdat
016200           25  BANK-SCR30-DTE3               PIC X(11).           cbankdat
016300           25  BANK-SCR30-TXN3               PIC X(1).            cbankdat
016400           25  BANK-SCR30-DET4               PIC X(1).            cbankdat
016500           25  BANK-SCR30-ACC4               PIC X(9).            cbankdat
016600           25  BANK-SCR30-DSC4               PIC X(15).           cbankdat
016700           25  BANK-SCR30-BAL4               PIC X(13).           cbankdat
016800           25  BANK-SCR30-SRV4               PIC X(6).            cbankdat
016900           25  BANK-SCR30-DTE4               PIC X(11).           cbankdat
017000           25  BANK-SCR30-TXN4               PIC X(1).            cbankdat
017100           25  BANK-SCR30-DET5               PIC X(1).            cbankdat
017200           25  BANK-SCR30-ACC5               PIC X(9).            cbankdat
017300           25  BANK-SCR30-DSC5               PIC X(15).           cbankdat
017400           25  BANK-SCR30-BAL5               PIC X(13).           cbankdat
017500           25  BANK-SCR30-SRV5               PIC X(6).            cbankdat
017600           25  BANK-SCR30-DTE5               PIC X(11).           cbankdat
017700           25  BANK-SCR30-TXN5               PIC X(1).            cbankdat
017800           25  BANK-SCR30-DET6               PIC X(1).            cbankdat
017900           25  BANK-SCR30-ACC6               PIC X(9).            cbankdat
018000           25  BANK-SCR30-DSC6               PIC X(15).           cbankdat
018100           25  BANK-SCR30-BAL6               PIC X(13).           cbankdat
018200           25  BANK-SCR30-SRV6               PIC X(6).            cbankdat
018300           25  BANK-SCR30-DTE6               PIC X(11).           cbankdat
018400           25  BANK-SCR30-TXN6               PIC X(1).            cbankdat
018500           25  BANK-SCR30-SRVMSG             PIC X(62).           cbankdat
018600         20  BANK-SCREEN30-DATA-R REDEFINES BANK-SCREEN30-DATA.   cbankdat
018700           25  BANK-SCREEN30-INPUT-DATA.                          cbankdat
018800             30  BANK-SCREEN30-INPUT         OCCURS 6 TIMES.      cbankdat
018900               35  BANK-SCR30-DET            PIC X(1).            cbankdat
019000               35  BANK-SCR30-ACC            PIC X(9).            cbankdat
019100               35  BANK-SCR30-DSC            PIC X(15).           cbankdat
019200               35  BANK-SCR30-BAL            PIC X(13).           cbankdat
019300               35  BANK-SCR30-SRV            PIC X(6).            cbankdat
019400               35  BANK-SCR30-DTE            PIC X(11).           cbankdat
019500               35  BANK-SCR30-TXN            PIC X(1).            cbankdat
019600                 88  BANK-SCR30-TXN-PRESENT  VALUE '*'.           cbankdat
019700         20  BANK-SCREEN35-DATA.                                  cbankdat
019800           25  BANK-SCR35-ACC                PIC X(9).            cbankdat
019900           25  BANK-SCR35-DSC                PIC X(15).           cbankdat
020000           25  BANK-SCR35-BAL                PIC X(13).           cbankdat
020100           25  BANK-SCR35-DTE                PIC X(11).           cbankdat
020200           25  BANK-SCR35-TRANS              PIC X(5).            cbankdat
020300           25  BANK-SCR35-ATM-FIELDS.                             cbankdat
020400             30  BANK-SCR35-ATM-ENABLED      PIC X(1).            cbankdat
020500             30  BANK-SCR35-ATM-LIM          PIC X(3).            cbankdat
020600             30  BANK-SCR35-ATM-LDTE         PIC X(11).           cbankdat
020700             30  BANK-SCR35-ATM-LAMT         PIC X(3).            cbankdat
020800           25  BANK-SCR35-RP-FIELDS.                              cbankdat
020900             30  BANK-SCR35-RP1-FIELDS.                           cbankdat
021000               35  BANK-SCR35-RP1DAY         PIC X(2).            cbankdat
021100               35  BANK-SCR35-RP1AMT         PIC X(10).           cbankdat
021200               35  BANK-SCR35-RP1PID         PIC X(5).            cbankdat
021300               35  BANK-SCR35-RP1ACC         PIC X(9).            cbankdat
021400               35  BANK-SCR35-RP1DTE         PIC X(11).           cbankdat
021500             30  BANK-SCR35-RP2-FIELDS.                           cbankdat
021600               35  BANK-SCR35-RP2DAY         PIC X(2).            cbankdat
021700               35  BANK-SCR35-RP2AMT         PIC X(10).           cbankdat
021800               35  BANK-SCR35-RP2PID         PIC X(5).            cbankdat
021900               35  BANK-SCR35-RP2ACC         PIC X(9).            cbankdat
022000               35  BANK-SCR35-RP2DTE         PIC X(11).           cbankdat
022100             30  BANK-SCR35-RP3-FIELDS.                           cbankdat
022200               35  BANK-SCR35-RP3DAY         PIC X(2).            cbankdat
022300               35  BANK-SCR35-RP3AMT         PIC X(10).           cbankdat
022400               35  BANK-SCR35-RP3PID         PIC X(5).            cbankdat
022500               35  BANK-SCR35-RP3ACC         PIC X(9).            cbankdat
022600               35  BANK-SCR35-RP3DTE         PIC X(11).           cbankdat
022700         20  BANK-SCREEN40-DATA.                                  cbankdat
022800           25  BANK-SCR40-ACC                PIC X(9).            cbankdat
022900           25  BANK-SCR40-ACCTYPE            PIC X(15).           cbankdat
023000           25  BANK-SCR40-TXN-FIELDS.                             cbankdat
023100             30  BANK-SCR40-DAT1             PIC X(11).           cbankdat
023200             30  BANK-SCR40-TIM1             PIC X(8).            cbankdat
023300             30  BANK-SCR40-AMT1             PIC X(13).           cbankdat
023400             30  BANK-SCR40-DSC1             PIC X(30).           cbankdat
023500             30  BANK-SCR40-DAT2             PIC X(11).           cbankdat
023600             30  BANK-SCR40-TIM2             PIC X(8).            cbankdat
023700             30  BANK-SCR40-AMT2             PIC X(13).           cbankdat
023800             30  BANK-SCR40-DSC2             PIC X(30).           cbankdat
023900             30  BANK-SCR40-DAT3             PIC X(11).           cbankdat
024000             30  BANK-SCR40-TIM3             PIC X(8).            cbankdat
024100             30  BANK-SCR40-AMT3             PIC X(13).           cbankdat
024200             30  BANK-SCR40-DSC3             PIC X(30).           cbankdat
024300             30  BANK-SCR40-DAT4             PIC X(11).           cbankdat
024400             30  BANK-SCR40-TIM4             PIC X(8).            cbankdat
024500             30  BANK-SCR40-AMT4             PIC X(13).           cbankdat
024600             30  BANK-SCR40-DSC4             PIC X(30).           cbankdat
024700             30  BANK-SCR40-DAT5             PIC X(11).           cbankdat
024800             30  BANK-SCR40-TIM5             PIC X(8).            cbankdat
024900             30  BANK-SCR40-AMT5             PIC X(13).           cbankdat
025000             30  BANK-SCR40-DSC5             PIC X(30).           cbankdat
025100             30  BANK-SCR40-DAT6             PIC X(11).           cbankdat
025200             30  BANK-SCR40-TIM6             PIC X(8).            cbankdat
025300             30  BANK-SCR40-AMT6             PIC X(13).           cbankdat
025400             30  BANK-SCR40-DSC6             PIC X(30).           cbankdat
025500             30  BANK-SCR40-DAT7             PIC X(11).           cbankdat
025600             30  BANK-SCR40-TIM7             PIC X(8).            cbankdat
025700             30  BANK-SCR40-AMT7             PIC X(13).           cbankdat
025800             30  BANK-SCR40-DSC7             PIC X(30).           cbankdat
025900             30  BANK-SCR40-DAT8             PIC X(11).           cbankdat
026000             30  BANK-SCR40-TIM8             PIC X(8).            cbankdat
026100             30  BANK-SCR40-AMT8             PIC X(13).           cbankdat
026200             30  BANK-SCR40-DSC8             PIC X(30).           cbankdat
026300         20  BANK-SCREEN40-DATA-R REDEFINES BANK-SCREEN40-DATA.   cbankdat
026400           25  BANK-SCR40-ACC-R              PIC X(9).            cbankdat
026500           25  BANK-SCR40-ACCTYPE-R          PIC X(15).           cbankdat
026600           25  BANK-SCREEN40-TXNS            OCCURS 8 TIMES.      cbankdat
026700             30  BANK-SCR40-DATE             PIC X(11).           cbankdat
026800             30  BANK-SCR40-TIME             PIC X(8).            cbankdat
026900             30  BANK-SCR40-AMNT             PIC X(13).           cbankdat
027000             30  BANK-SCR40-DESC             PIC X(30).           cbankdat
027100         20  BANK-SCREEN50-DATA.                                  cbankdat
027200           25  BANK-SCR50-XFER               PIC X(8).            cbankdat
027300           25  BANK-SCR50-FRM1               PIC X(1).            cbankdat
027400           25  BANK-SCR50-TO1                PIC X(1).            cbankdat
027500           25  BANK-SCR50-ACC1               PIC X(9).            cbankdat
027600           25  BANK-SCR50-DSC1               PIC X(15).           cbankdat
027700           25  BANK-SCR50-BAL1               PIC X(13).           cbankdat
027800           25  BANK-SCR50-FRM2               PIC X(1).            cbankdat
027900           25  BANK-SCR50-TO2                PIC X(1).            cbankdat
028000           25  BANK-SCR50-ACC2               PIC X(9).            cbankdat
028100           25  BANK-SCR50-DSC2               PIC X(15).           cbankdat
028200           25  BANK-SCR50-BAL2               PIC X(13).           cbankdat
028300           25  BANK-SCR50-FRM3               PIC X(1).            cbankdat
028400           25  BANK-SCR50-TO3                PIC X(1).            cbankdat
028500           25  BANK-SCR50-ACC3               PIC X(9).            cbankdat
028600           25  BANK-SCR50-DSC3               PIC X(15).           cbankdat
028700           25  BANK-SCR50-BAL3               PIC X(13).           cbankdat
028800           25  BANK-SCR50-FRM4               PIC X(1).            cbankdat
028900           25  BANK-SCR50-TO4                PIC X(1).            cbankdat
029000           25  BANK-SCR50-ACC4               PIC X(9).            cbankdat
029100           25  BANK-SCR50-DSC4               PIC X(15).           cbankdat
029200           25  BANK-SCR50-BAL4               PIC X(13).           cbankdat
029300           25  BANK-SCR50-FRM5               PIC X(1).            cbankdat
029400           25  BANK-SCR50-TO5                PIC X(1).            cbankdat
029500           25  BANK-SCR50-ACC5               PIC X(9).            cbankdat
029600           25  BANK-SCR50-DSC5               PIC X(15).           cbankdat
029700           25  BANK-SCR50-BAL5               PIC X(13).           cbankdat
029800           25  BANK-SCR50-FRM6               PIC X(1).            cbankdat
029900           25  BANK-SCR50-TO6                PIC X(1).            cbankdat
030000           25  BANK-SCR50-ACC6               PIC X(9).            cbankdat
030100           25  BANK-SCR50-DSC6               PIC X(15).           cbankdat
030200           25  BANK-SCR50-BAL6               PIC X(13).           cbankdat
030300           25  BANK-SCR50-ERRMSG             PIC X(62).           cbankdat
030400         20  BANK-SCREEN60-DATA.                                  cbankdat
030500           25  BANK-SCR60-RETURN-TO          PIC X(8).            cbankdat
030600           25  BANK-SCR60-CONTACT-ID         PIC X(5).            cbankdat
030700           25  BANK-SCR60-CONTACT-NAME       PIC X(25).           cbankdat
030800           25  BANK-SCR60-CHANGE-ACTION      PIC X(1).            cbankdat
030900             88  ADDR-CHANGE-REQUEST         VALUE ' '.           cbankdat
031000             88  ADDR-CHANGE-VERIFY          VALUE 'V'.           cbankdat
031100             88  ADDR-CHANGE-COMMIT          VALUE 'U'.           cbankdat
031200           25  BANK-SCR60-OLD-DETS.                               cbankdat
031300             30  BANK-SCR60-OLD-ADDR1        PIC X(25).           cbankdat
031400             30  BANK-SCR60-OLD-ADDR2        PIC X(25).           cbankdat
031500             30  BANK-SCR60-OLD-STATE        PIC X(2).            cbankdat
031600             30  BANK-SCR60-OLD-CNTRY        PIC X(6).            cbankdat
031700             30  BANK-SCR60-OLD-PSTCDE       PIC X(6).            cbankdat
031800             30  BANK-SCR60-OLD-TELNO        PIC X(12).           cbankdat
031900             30  BANK-SCR60-OLD-EMAIL        PIC X(30).           cbankdat
032000             30  BANK-SCR60-OLD-SEND-MAIL    PIC X(1).            cbankdat
032100             30  BANK-SCR60-OLD-SEND-EMAIL   PIC X(1).            cbankdat
032200           25  BANK-SCR60-NEW-DETS.                               cbankdat
032300             30  BANK-SCR60-NEW-ADDR1        PIC X(25).           cbankdat
032400             30  BANK-SCR60-NEW-ADDR2        PIC X(25).           cbankdat
032500             30  BANK-SCR60-NEW-STATE        PIC X(2).            cbankdat
032600             30  BANK-SCR60-NEW-CNTRY        PIC X(6).            cbankdat
032700             30  BANK-SCR60-NEW-PSTCDE       PIC X(6).            cbankdat
032800             30  BANK-SCR60-NEW-TELNO        PIC X(12).           cbankdat
032900             30  BANK-SCR60-NEW-EMAIL        PIC X(30).           cbankdat
033000             30  BANK-SCR60-NEW-SEND-MAIL    PIC X(1).            cbankdat
033100             30  BANK-SCR60-NEW-SEND-EMAIL   PIC X(1).            cbankdat
033200         20  BANK-SCREEN70-DATA.                                  cbankdat
033300           25  BANK-SCR70-AMOUNT             PIC X(7).            cbankdat
033400           25  BANK-SCR70-RATE               PIC X(7).            cbankdat
033500           25  BANK-SCR70-TERM               PIC X(5).            cbankdat
033600           25  BANK-SCR70-PAYMENT            PIC X(9).            cbankdat
033700         20  BANK-SCREEN80-DATA.                                  cbankdat
033800           25  BANK-SCR80-CONTACT-ID         PIC X(5).            cbankdat
033900           25  BANK-SCR80-CONTACT-NAME       PIC X(25).           cbankdat
034000           25  BANK-SCR80-PRINT-ACTION       PIC X(1).            cbankdat
034100             88  PRINT-REQUEST               VALUE ' '.           cbankdat
034200             88  PRINT-CONFIRM               VALUE 'C'.           cbankdat
034300           25  BANK-SCR80-DETS.                                   cbankdat
034400             30  BANK-SCR80-ADDR1            PIC X(25).           cbankdat
034500             30  BANK-SCR80-ADDR2            PIC X(25).           cbankdat
034600             30  BANK-SCR80-STATE            PIC X(2).            cbankdat
034700             30  BANK-SCR80-CNTRY            PIC X(6).            cbankdat
034800             30  BANK-SCR80-PSTCDE           PIC X(6).            cbankdat
034900             30  BANK-SCR80-EMAIL            PIC X(30).           cbankdat
035000             30  BANK-SCR80-OPT1             PIC X(1).            cbankdat
035100             30  BANK-SCR80-OPT2             PIC X(1).            cbankdat
035200          20  BANK-SCREEN90-DATA.                                 cbankdat
035300           25  BANK-SCR90-SCRN               PIC X(6).            cbankdat
035400           25  BANK-SCR90-SCRN-STATUS        PIC X(1).            cbankdat
035500           25 BANK-SCR90-LINE                PIC X(75)            cbankdat
035600               OCCURS 19 TIMES.                                   cbankdat
035700         20  BANK-SCREENZZ-DATA.                                  cbankdat
035800           25  BANK-SCRZZ-SEL1ID             PIC X(1).            cbankdat
035900           25  BANK-SCRZZ-SEL1IP             PIC X(1).            cbankdat
036000           25  BANK-SCRZZ-SEL1TX             PIC X(40).           cbankdat
036100           25  BANK-SCRZZ-SEL2ID             PIC X(1).            cbankdat
036200           25  BANK-SCRZZ-SEL2IP             PIC X(1).            cbankdat
036300           25  BANK-SCRZZ-SEL2TX             PIC X(40).           cbankdat
036400           25  BANK-SCRZZ-SEL3ID             PIC X(1).            cbankdat
036500           25  BANK-SCRZZ-SEL3IP             PIC X(1).            cbankdat
036600           25  BANK-SCRZZ-SEL3TX             PIC X(40).           cbankdat
036700           25  BANK-SCRZZ-SEL4ID             PIC X(1).            cbankdat
036800           25  BANK-SCRZZ-SEL4IP             PIC X(1).            cbankdat
036900           25  BANK-SCRZZ-SEL4TX             PIC X(40).           cbankdat
037000           25  BANK-SCRZZ-SEL5ID             PIC X(1).            cbankdat
037100           25  BANK-SCRZZ-SEL5IP             PIC X(1).            cbankdat
037200           25  BANK-SCRZZ-SEL5TX             PIC X(40).           cbankdat
037300           25  BANK-SCRZZ-SEL6ID             PIC X(1).            cbankdat
037400           25  BANK-SCRZZ-SEL6IP             PIC X(1).            cbankdat
037500           25  BANK-SCRZZ-SEL6TX             PIC X(40).           cbankdat
037600           25  BANK-SCRZZ-SEL7ID             PIC X(1).            cbankdat
037700           25  BANK-SCRZZ-SEL7IP             PIC X(1).            cbankdat
037800           25  BANK-SCRZZ-SEL7TX             PIC X(40).           cbankdat
037900           25  BANK-SCRZZ-SEL8ID             PIC X(1).            cbankdat
038000           25  BANK-SCRZZ-SEL8IP             PIC X(1).            cbankdat
038100           25  BANK-SCRZZ-SEL8TX             PIC X(40).           cbankdat
038200         20  BANK-SCREENZZ-DATA-R REDEFINES BANK-SCREENZZ-DATA.   cbankdat
038300           25  BANK-SCREENZZ-FIELD           OCCURS 8 TIMES.      cbankdat
038400             30  BANK-SCRZZ-ID               PIC X(1).            cbankdat
038500             30  BANK-SCRZZ-IP               PIC X(1).            cbankdat
038600             30  BANK-SCRZZ-TX               PIC X(40).           cbankdat
038700                                                                  cbankdat
038800* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     cbankdat
