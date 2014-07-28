\ coolant (jmcc) #2

: param 10 0 do 0 2000 Rand.ir 40 + 1 1 loop 30 mce ;
: n BrownNoise.ar 2 clone 0.002 * 0.95 OnePole ;
: coolant n 1 0 1 param Klank.ar 2 clone ;
: coolants coolant 4 4 2 inf overlap-texture ;

coolants
