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

       01  BALANCE-OUT.
001400   05  OUT03-DATA.                                                cbankd03
001500     10  OUT03I-DATA.                                             cbankd03
001600       15  OUT03I-CONTACT-ID                  PIC X(5).           cbankd03
001700     10  OUT03O-DATA.                                             cbankd03
001800       15  OUT03O-ACC1                        PIC X(9).           cbankd03
001900       15  OUT03O-DSC1                        PIC X(15).          cbankd03
002000       15  OUT03O-BAL1                        PIC X(9).           cbankd03
002100*      15  OUT03O-BAL1N REDEFINES OUT03O-BAL1  PIC S9(7)V99.      cbankd03
002200       15  OUT03O-DTE1                        PIC X(10).          cbankd03
002300       15  OUT03O-TXN1                        PIC X(1).           cbankd03
002400       15  OUT03O-ACC2                        PIC X(9).           cbankd03
002500       15  OUT03O-DSC2                        PIC X(15).          cbankd03
002600       15  OUT03O-BAL2                        PIC X(9).           cbankd03
002700*      15  OUT03O-BAL2N REDEFINES OUT03O-BAL2  PIC S9(7)V99.      cbankd03
002800       15  OUT03O-DTE2                        PIC X(10).          cbankd03
002900       15  OUT03O-TXN2                        PIC X(1).           cbankd03
003000       15  OUT03O-ACC3                        PIC X(9).           cbankd03
003100       15  OUT03O-DSC3                        PIC X(15).          cbankd03
003200       15  OUT03O-BAL3                        PIC X(9).           cbankd03
003300*      15  OUT03O-BAL3N REDEFINES OUT03O-BAL3  PIC S9(7)V99.      cbankd03
003400       15  OUT03O-DTE3                        PIC X(10).          cbankd03
003500       15  OUT03O-TXN3                        PIC X(1).           cbankd03
003600       15  OUT03O-ACC4                        PIC X(9).           cbankd03
003700       15  OUT03O-DSC4                        PIC X(15).          cbankd03
003800       15  OUT03O-BAL4                        PIC X(9).           cbankd03
003900*      15  OUT03O-BAL4N REDEFINES OUT03O-BAL4  PIC S9(7)V99.      cbankd03
004000       15  OUT03O-DTE4                        PIC X(10).          cbankd03
004100       15  OUT03O-TXN4                        PIC X(1).           cbankd03
004200       15  OUT03O-ACC5                        PIC X(9).           cbankd03
004300       15  OUT03O-DSC5                        PIC X(15).          cbankd03
004400       15  OUT03O-BAL5                        PIC X(9).           cbankd03
004500*      15  OUT03O-BAL5N REDEFINES OUT03O-BAL5  PIC S9(7)V99.      cbankd03
004600       15  OUT03O-DTE5                        PIC X(10).          cbankd03
004700       15  OUT03O-TXN5                        PIC X(1).           cbankd03
004800       15  OUT03O-ACC6                        PIC X(9).           cbankd03
004900       15  OUT03O-DSC6                        PIC X(15).          cbankd03
005000       15  OUT03O-BAL6                        PIC X(9).           cbankd03
005100*      15  OUT03O-BAL6NN REDEFINES OUT03O-BAL6  PIC -(7).99.      cbankd03
005200       15  OUT03O-DTE6                        PIC X(10).          cbankd03
005300       15  OUT03O-TXN6                        PIC X(1).           cbankd03
005400     10  OUT03O-DATA-R REDEFINES OUT03O-DATA.                     cbankd03
005500       15  OUT03O-ACC-INFO                    OCCURS 6 TIMES.     cbankd03
005600         20  OUT03O-ACC-NO                    PIC X(9).           cbankd03
005700         20  OUT03O-ACC-DESC                  PIC X(15).          cbankd03
005800         20  OUT03O-ACC-BAL                   PIC X(9).           cbankd03
005900*        20  OUT03O-ACC-BAL-N REDEFINES OUT03O-ACC-BAL            cbankd03
006000*                                            PIC S9(7)V99.        cbankd03
006100         20  OUT03O-DTE                       PIC X(10).          cbankd03
006200         20  OUT03O-TXN                       PIC X(1).           cbankd03
006300                                                                  cbankd03
