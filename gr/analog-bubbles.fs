\ analog bubbles (jmcc) #1

8 7.23 2 mce 0 LFSaw.kr 3 * 80 + ( offset )
0.4 0 LFSaw.kr 24 * + MIDICPS ( freq )
0 SinOsc.ar 0.04 * 0.2 0.2 4 CombN
play

( 0.4 0 lfsaw.kr 2 * 8 7.23 mce2 0 lfsaw.kr 0.25 * 9.667 + + exp2
  0 sinosc.ar 0.04 * 0.2 0.2 4 combn play )
