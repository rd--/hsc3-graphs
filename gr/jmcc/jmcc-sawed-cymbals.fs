\ SAWED CYMBALS (JMCC) #9

: R2 RAND.IR ;
: PARAM 15 0 DO 500 2500 R2 DUP 0 8000 R2 + R2 1 2 6 R2 LOOP 45 MCE ;
: EXC 0 600 R2 0 600 R2 12 DO-NOTHING XLINE.KR ;
: CYM EXC 0 LFSAW.AR 0.0005 * 1 0 1 PARAM KLANK ;
CYM 4 4 6 INF OVERLAP-TEXTURE