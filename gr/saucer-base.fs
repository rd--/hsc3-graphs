\ SAUCER BASE (JMCC) #6

: R1 0 SWAP RAND.IR ;
: RLOC -1 1 RAND.IR 1 PAN2 ;
: OSC SINOSC.AR ;
: DRMS dup rot * swap 1.1 * + ;
: SB 20 R1 0 OSC 1000 R1 DRMS 0 OSC 5000 R1 DRMS 0 OSC 0.1 * RLOC ;
SB 2 6 4 INF OVERLAP-TEXTURE
