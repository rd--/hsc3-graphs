\ string wander-cluster (jmcc) #6

: t 6 0 do 0.15 i 6 / Impulse.kr loop 6 mce ;
: g 6 0 do 0.15 i 6 / 0.5 LFPulse.kr loop 6 mce ;
: e g 1 0 1 do-nothing 1.3 0.1 1.3 env-sin env-asr EnvGen.kr ;
: d 1 50 100 t TRand.kr 0 15 t TRand.kr + 7 - 50 120 Fold MIDICPS / ;
: sw WhiteNoise.ar 0.008 * 0.01 d d 1000 * CombC -1 1 t TRand.kr e Pan2 mix ;
sw play
