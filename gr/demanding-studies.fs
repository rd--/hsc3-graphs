\ demanding studies (jmcc)

5 13 1 0.2 MouseX.kr ( x )
0 Impulse.kr ( tr )
0 dinf 72 75 79 82 4 mce α Drand.dr ( s1 )
12 swap - MIDICPS dinf 72 75 79 1 82 84 86 3 mce β Drand.dr ( s2 )
4 mce γ Dseq.dr ( s3 )
MIDICPS mce2 Demand.kr ( f )
dup 0 0.7 mce2 + 0 SinOsc.ar ( o1 )
swap 0 0.7 mce2 + Saw.ar 0.3 * ( o2 )
+ Distort Log Distort Cubed 0.1 *
