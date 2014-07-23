\ lfo modulation (jmcc) #1

0.6 0.7 mce2 0 FSinOsc.kr 3600 * 4000 + ( p )
0.05 0 FSinOsc.kr 80 * 160 + ( o )
0 0.4 LFPulse.ar 0.05 * swap 0.2 RLPF ( s )
0.3 0.2 0.25 mce2 2 CombL
