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
000600                                                                  cbankvcs
000700***************************************************************** cbankvcs
000800* CBANKVCS.CPY                                                  * cbankvcs
000900*---------------------------------------------------------------* cbankvcs
001000* This is the record file record layout for bank customers      * cbankvcs
001100***************************************************************** cbankvcs
001200   05  BCS-RECORD                            PIC X(250).          cbankvcs
001300   05  FILLER REDEFINES BCS-RECORD.                               cbankvcs
001400     10  BCS-REC-PID                         PIC X(5).            cbankvcs
001500     10  BCS-REC-NAME                        PIC X(25).           cbankvcs
001600     10  BCS-REC-NAME-FF                     PIC X(25).           cbankvcs
001700     10  BCS-REC-SIN                         PIC X(9).            cbankvcs
001800     10  BCS-REC-ADDR1                       PIC X(25).           cbankvcs
001900     10  BCS-REC-ADDR2                       PIC X(25).           cbankvcs
002000     10  BCS-REC-STATE                       PIC X(2).            cbankvcs
002100     10  BCS-REC-CNTRY                       PIC X(6).            cbankvcs
002200     10  BCS-REC-POST-CODE                   PIC X(6).            cbankvcs
002300     10  BCS-REC-TEL                         PIC X(12).           cbankvcs
002400     10  BCS-REC-EMAIL                       PIC X(30).           cbankvcs
002500     10  BCS-REC-SEND-MAIL                   PIC X(1).            cbankvcs
002600     10  BCS-REC-SEND-EMAIL                  PIC X(1).            cbankvcs
002700     10  BCS-REC-ATM-PIN                     PIC X(4).            cbankvcs
002800     10  BCS-REC-FILLER                      PIC X(74).           cbankvcs
002900                                                                  cbankvcs
003000* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     cbankvcs
