\ demanding studies (jmcc)
5 13 1 0.2 MouseX.kr ( x )
0 Impulse.kr ( tr )
0 inf 72 75 79 82 4 mce Drand.dr ( s1 )
12 - MidiCps inf 72 75 79 1 82 84 86 3 mce Drand.dr ( s2 )
4 mce Dseq.dr ( s3 )
MidiCps 2 mce Demand.kr ( f )
dup 0 0.7 2 mce + 0 SinOsc.ar ( o1 )
swap 0 0.7 2 mce + Saw.ar 0.3 * ( o2 )
+ Distort Log Distort Cubed 0.1 *