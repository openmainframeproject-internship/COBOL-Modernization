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
000600                                                                  cbankd02
000700***************************************************************** cbankd02
000800* CBANKD02.CPY                                                  * cbankd02
000900*---------------------------------------------------------------* cbankd02
001000* This area is used to pass data between a requesting program   * cbankd02
001100* and the I/O program (DBANK02P) which retrieves or updates     * cbankd02
001200* address information.                                          * cbankd02
001300***************************************************************** cbankd02
001400   05  CD02-DATA.                                                 cbankd02
001500     10  CD02I-DATA.                                              cbankd02
001600       15  CD02I-FUNCTION                    PIC X(1).            cbankd02
001700         88  CD02I-READ                      VALUE 'R'.           cbankd02
001800         88  CD02I-WRITE                     VALUE 'W'.           cbankd02
001900       15  CD02I-CONTACT-ID                  PIC X(5).            cbankd02
002000       15  CD02I-CONTACT-NAME                PIC X(25).           cbankd02
002100       15  CD02I-CONTACT-ADDR1               PIC X(25).           cbankd02
002200       15  CD02I-CONTACT-ADDR2               PIC X(25).           cbankd02
002300       15  CD02I-CONTACT-STATE               PIC X(2).            cbankd02
002400       15  CD02I-CONTACT-CNTRY               PIC X(6).            cbankd02
002500       15  CD02I-CONTACT-PSTCDE              PIC X(6).            cbankd02
002600       15  CD02I-CONTACT-TELNO               PIC X(12).           cbankd02
002700       15  CD02I-CONTACT-EMAIL               PIC X(30).           cbankd02
002800       15  CD02I-CONTACT-SEND-MAIL           PIC X(1).            cbankd02
002900       15  CD02I-CONTACT-SEND-EMAIL          PIC X(1).            cbankd02
003000     10  CD02O-DATA.                                              cbankd02
003100       15  CD02O-CONTACT-ID                  PIC X(5).            cbankd02
003200       15  CD02O-CONTACT-NAME                PIC X(25).           cbankd02
003300       15  CD02O-CONTACT-ADDR1               PIC X(25).           cbankd02
003400       15  CD02O-CONTACT-ADDR2               PIC X(25).           cbankd02
003500       15  CD02O-CONTACT-STATE               PIC X(2).            cbankd02
003600       15  CD02O-CONTACT-CNTRY               PIC X(6).            cbankd02
003700       15  CD02O-CONTACT-PSTCDE              PIC X(6).            cbankd02
003800       15  CD02O-CONTACT-TELNO               PIC X(12).           cbankd02
003900       15  CD02O-CONTACT-EMAIL               PIC X(30).           cbankd02
004000       15  CD02O-CONTACT-SEND-MAIL           PIC X(1).            cbankd02
004100       15  CD02O-CONTACT-SEND-EMAIL          PIC X(1).            cbankd02
004200                                                                  cbankd02
004300* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     cbankd02
