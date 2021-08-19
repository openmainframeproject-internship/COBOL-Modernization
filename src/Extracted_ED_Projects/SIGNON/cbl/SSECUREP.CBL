000100***************************************************************** ssecurep
000200*                                                               * ssecurep
000300*   Copyright (C) 1998-2021 Micro Focus. All Rights Reserved.   * ssecurep
000400*   This demonstration program is provided for use by users     * ssecurep
000500*   of Micro Focus products and may be used, modified and       * ssecurep
000600*   distributed as part of your application provided that       * ssecurep
000700*   you properly acknowledge the copyright of Micro Focus       * ssecurep
000800*   in this material.                                           * ssecurep
000900*                                                               * ssecurep
001000***************************************************************** ssecurep
001100                                                                  ssecurep
001200***************************************************************** ssecurep
001300* Program:     SSECUREP.CBL                                     * ssecurep
001400* Layer:       Screen handling                                  * ssecurep
001500* Function:    Set flag to determine if security required       * ssecurep
001600***************************************************************** ssecurep
001700                                                                  ssecurep
001800 IDENTIFICATION DIVISION.                                         ssecurep
001900 PROGRAM-ID.                                                      ssecurep
002000     SSECUREP.                                                    ssecurep
002100 DATE-WRITTEN.                                                    ssecurep
002200     September 2002.                                              ssecurep
002300 DATE-COMPILED.                                                   ssecurep
002400     Today.                                                       ssecurep
002500                                                                  ssecurep
002600 ENVIRONMENT DIVISION.                                            ssecurep
002700                                                                  ssecurep
002800 DATA DIVISION.                                                   ssecurep
002900 WORKING-STORAGE SECTION.                                         ssecurep
003000***************************************************************** ssecurep
003100* Security flag                                                 * ssecurep
003200*---------------------------------------------------------------* ssecurep
003300* Set to Y to signal SIGNON/SIGNOFF etc processing required.    * ssecurep
003400* Anything else will indicate no security.                      * ssecurep
003500***************************************************************** ssecurep
003600 01  WS-SECURITY-FLAG                        PIC X(1).            ssecurep
003700   88  SECURITY-NOT-REQUIRED                 VALUE SPACE.         ssecurep
003800   88  SECURITY-REQUIRED                     VALUE 'Y'.           ssecurep
003900                                                                  ssecurep
004000 LINKAGE SECTION.                                                 ssecurep
004100 01  LK-SECURITY-TRAN                        PIC X(8).            ssecurep
004200 01  LK-SECURITY-FLAG                        PIC X(1).            ssecurep
004300                                                                  ssecurep
004400 PROCEDURE DIVISION USING LK-SECURITY-TRAN                        ssecurep
004500                          LK-SECURITY-FLAG.                       ssecurep
004600***************************************************************** ssecurep
004700* Set the appropriate value and move it to callers area         * ssecurep
004800***************************************************************** ssecurep
004900     SET SECURITY-NOT-REQUIRED TO TRUE.                           ssecurep
005000*    SET SECURITY-REQUIRED TO TRUE.                               ssecurep
005100     MOVE WS-SECURITY-FLAG TO LK-SECURITY-FLAG.                   ssecurep
005200     GOBACK.                                                      ssecurep
005300                                                                  ssecurep
005400* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     ssecurep
