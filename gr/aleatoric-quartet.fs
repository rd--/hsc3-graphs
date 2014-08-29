\ aleatoric quartet (jmcc) #7

: rand2 { n } n neg n Rand.ir ;

: amp 0.07 ;
: base_mn 66 ;
: dmul 0.01 1 0 0.1 MouseX.kr Recip 0.5 * amp * ;
: mk_f 1 0.5 0.25 3 mce Choose LFNoise0.kr 7 * base_mn + 30 Rand2 + 1 Round 0.2 Lag MIDICPS ;
: mk_s PinkNoise.ar 0 8 LFNoise1.kr dmul * amp dmul - + Max * 0.02 mk_f Recip 3 CombL 1 Rand2 1 Pan2 ;
: rapf 0.05 0 0.05 Rand.ir 2 clone 1 AllpassN ;
: aq mk_s 4 clone mix 5 0 do rapf loop 0.995 LeakDC ;
aq play
