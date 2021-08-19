000100***************************************************************** cabendd 
000200*                                                               * cabendd 
000300*  Copyright(C) 1998-2021 Micro Focus. All Rights Reserved.     * cabendd 
000400*                                                               * cabendd 
000500***************************************************************** cabendd 
000600                                                                  cabendd 
000700***************************************************************** cabendd 
000800* CABENDD.CPY                                                   * cabendd 
000900*---------------------------------------------------------------* cabendd 
001000* Work areas for abend routine                                  * cabendd 
001100***************************************************************** cabendd 
001200 01  ABEND-DATA.                                                  cabendd 
001300   05  ABEND-CODE                            PIC X(4)             cabendd 
001400       VALUE SPACES.                                              cabendd 
001500   05  ABEND-CULPRIT                         PIC X(8)             cabendd 
001600       VALUE SPACES.                                              cabendd 
001700   05  ABEND-REASON                          PIC X(50)            cabendd 
001800       VALUE SPACES.                                              cabendd 
001900   05  ABEND-MSG                             PIC X(72)            cabendd 
002000       VALUE SPACES.                                              cabendd 
002100                                                                  cabendd 
002200* $ Version 5.99c sequenced on Wednesday 3 Mar 2011 at 1:00pm     cabendd 
