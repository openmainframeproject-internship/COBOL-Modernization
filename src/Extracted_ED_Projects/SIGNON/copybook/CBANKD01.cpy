000100***************************************************************** cbankd01
000200*                                                               * cbankd01
000300*  Copyright(C) 1998-2021 Micro Focus. All Rights Reserved.     * cbankd01
000400*                                                               * cbankd01
000500***************************************************************** cbankd01
000600                                                                  cbankd01
000700***************************************************************** cbankd01
000800* CBANKD01.CPY                                                  * cbankd01
000900*---------------------------------------------------------------* cbankd01
001000* This area is used to pass data between a requesting program   * cbankd01
001100* and the I/O program (DBANK01P) which retrieves the customer   * cbankd01
001200* information.                                                  * cbankd01
001300***************************************************************** cbankd01
001400   05  CD01-DATA.                                                 cbankd01
001500     10  CD01I-DATA.                                              cbankd01
001600       15  CD01I-PERSON-PID                  PIC X(5).            cbankd01
001700     10  CD01O-DATA.                                              cbankd01
001800       15  CD01O-PERSON-PID                  PIC X(5).            cbankd01
001900       15  CD01O-PERSON-NAME                 PIC X(25).           cbankd01
002000                                                                  cbankd01
002100* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     cbankd01
