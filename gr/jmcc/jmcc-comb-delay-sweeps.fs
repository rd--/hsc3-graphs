\ comb delay sweeps (jmcc) #6

: t 6 0 do 0.15 i 6 / Impulse.kr loop 6 mce ;
: g 6 0 do 0.15 i 6 / 0.5 LFPulse.kr loop 6 mce ;
: e g 1 0 1 do-nothing 1.3 0.1 1.3 env-sin env-asr EnvGen.kr ;
: d -7 8 t TRand.ir 50 120 Fold ;
: w WhiteNoise.ar 0.005 * 0.01 ;
: cds w 1 d d 4 0 Line.kr MIDICPS / 1 d MIDICPS / 1000 * CombC -1 1 t TRand.ir e Pan2 ;
cds mix play