\ sweepy noise (jmcc) #6

: x 4 60 1 0.1 MouseX.kr ;
: y 200 8000 1 0.1 MouseY.kr ;
: f WhiteNoise.ar 2 clone 0.03 * x 0 LFSaw.kr y * y 1.2 * + 0.1 RLPF ;
f 0.3 0.3 2 CombN f + play
