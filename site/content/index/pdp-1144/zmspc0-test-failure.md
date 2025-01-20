# zmspc0 test failure

After moving the machine to France this test reported the following:

```
XXDP-XM EXTENDED MONITOR - XXDP V2.5
REVISION: F0
BOOTED FROM DD0
124KW OF MEMORY
UNIBUS SYSTEM

RESTART ADDRESS: 152000
TYPE "H" FOR HELP !

.R ZMSPC0.BIC
ZMSPC0.BIC

 CZMSPC  MS11-L/M/P MEMORY DIAGNOSTIC
   11/44 CACHE AVAILABLE

               CSR MAP

CSR     0 1 2 3 4 5 6 7 8 9 A B C D E F 
MEMTYPE P                               


   512K OF MS11-P
   512K WORDS OF MEMORY TOTAL

                        MEMORY CONFIGURATION MAP
                             16K WORD BANKS
                1       2       3       4       5       6       7  
        012345670123456701234567012345670123456701234567012345670123
ERRORS                                                              
INTRLV  --------------------------------                            
MEMTYPE PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP                            
CSR     00000000000000000000000000000000                            
PROTECT PP                                                          
FATAL UNEXPECTED TRAP TO 4
  PC     MMR0    MMR1    MMR2    MMR3   CPUERR
177644  000017  000000  062054  000020  000200
CONSOLE
17777707 047736
```

This is obviously not Good News(tm).

Running the rest through the Unibone, using a slightly different version, seems to work better:

```
.R ZMSPB0.BIC
ZMSPB0.BIC

 CZMSPB  MS11-L/M/P MEMORY DIAGNOSTIC
   11/44 CACHE AVAILABLE

               CSR MAP

CSR     0 1 2 3 4 5 6 7 8 9 A B C D E F 
MEMTYPE P                               


   512K OF MS11-P
   512K WORDS OF MEMORY TOTAL

                        MEMORY CONFIGURATION MAP
                             16K WORD BANKS
                1       2       3       4       5       6       7  
        012345670123456701234567012345670123456701234567012345670123
ERRORS                                                              
INTRLV  --------------------------------                            
MEMTYPE PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP                            
CSR     00000000000000000000000000000000                            
PROTECT PP                                                          
END PASS #QV     1
```