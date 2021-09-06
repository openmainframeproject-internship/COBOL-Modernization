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

       01 BRE-OUT-OUTPUT-STRUCTURE.
         02 BRE-O-CD02O-DATA.
           03 BRE-O-CD02O-CONTACT PIC X(5).
           03 BRE-O-CD02O-CONTACT0 PIC X(25).
           03 BRE-O-CD02O-CONTACT1 PIC X(25).
           03 BRE-O-CD02O-CONTACT2 PIC X(25).
           03 BRE-O-CD02O-CONTACT3 PIC X(2).
           03 BRE-O-CD02O-CONTACT4 PIC X(6).
           03 BRE-O-CD02O-CONTACT5 PIC X(6).
           03 BRE-O-CD02O-CONTACT6 PIC X(12).
           03 BRE-O-CD02O-CONTACT7 PIC X(30).
           03 BRE-O-CD02O-CONTACT8 PIC X(1).
           03 BRE-O-CD02O-CONTACT9 PIC X(1).
         02 BRE-O-EIBRESP PIC S9(8) USAGE IS BINARY.
