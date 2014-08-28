\ synthetic piano (jmcc) #3

: n 36 90 IRand.ir ;
: f 0.1 0.5 Rand.ir ;
: ph 0 6.28319 Rand.ir ;
: c { o }
    3000 LFNoise2.ar f ph Impulse.ar
    0.1 * 0.008 0.04 Decay2 * 1 n o + MIDICPS / 1 n -0.05 + MIDICPS /
    6 CombL ;
: sp -0.05 c 0 c + 0.04 c + n 36 - 27 / 1 - 1 Pan2 ;
sp 6 0 6 inf overlap-texture
