000100***************************************************************** cpswdd01
000200*                                                               * cpswdd01
000300*  Copyright(C) 1998-2021 Micro Focus. All Rights Reserved.     * cpswdd01
000400*                                                               * cpswdd01
000500***************************************************************** cpswdd01
000600                                                                  cpswdd01
000700***************************************************************** cpswdd01
000800* CPSWDD01.CPY                                                  * cpswdd01
000900*---------------------------------------------------------------* cpswdd01
001000* This area is used to pass data between a requesting program   * cpswdd01
001100* and the "I/O" program (SPSWD01P) which checks the supplied    * cpswdd01
001200* usewrid/password against the current security model           * cpswdd01
001300***************************************************************** cpswdd01
001400   05  CPSWDD01-DATA.                                             cpswdd01
001500     10  CPSWDD01I-DATA.                                          cpswdd01
001600       15  CPSWDD01I-OPERATION               PIC X(1).            cpswdd01
001700         88  PSWD-NOOP                       VALUE '0'.           cpswdd01
001800         88  PSWD-SIGNON                     VALUE '1'.           cpswdd01
001900         88  PSWD-SIGNOFF                    VALUE '2'.           cpswdd01
002000       15  CPSWDD01I-USERID                  PIC X(8).            cpswdd01
002100       15  CPSWDD01I-PASSWORD                PIC X(8).            cpswdd01
002200     10  CPSWDD01O-DATA.                                          cpswdd01
002300       15  CPSWDD01O-MESSAGE                 PIC X(75).           cpswdd01
002400                                                                  cpswdd01
002500* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     cpswdd01
