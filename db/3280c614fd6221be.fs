\ Ring modulated klank (Jmcc) #2 texture=overlap,4,4,4,inf
: p 8 ;
: param [ p 0 do 100 10000 Rand.ir 1 0.2 1 Rand.ir loop p ] ;
0.1 0.4 Rand.ir LfNoise2.kr 200 * 350 400 Rand.ir + 0 SinOsc.ar 20 Dust.ar 0.02 *
1 0 1 param Klank.ar * -1 1 Rand.ir 1 Pan2
