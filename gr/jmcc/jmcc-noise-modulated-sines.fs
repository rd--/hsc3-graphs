\ noise modulated sines (jmcc) #6

: f 60 100 Rand.ir MIDICPS ;
: nms f f 0.2 + 2 mce 0 FSinOsc.ar f 0.15 0.16 2 mce * LFNoise2.kr 0.1 * * ;
: pp { z } z 0.3 0.3 4 CombN.ar z unmce swap 2 mce + ;
' pp texture-post-proc
nms 4 4 4 inf overlap-texture