\ hard sync sawtooth with lfo (jmcc) #6

: hsswl
    0 50 Rand.ir 30 + MIDICPS { f }
    0.2 0 0 pi 2 * Rand.ir 2 mce SinOsc.kr 2 f * * 3 f * + { o }
    f f 0.2 + 2 mce o SyncSaw.ar 0.05 * ;

: rev unmce swap 2 mce ;
: cmb 0 2 In.ar { z } z 0.3 0.3 4 CombN.ar z rev + ;

cmb -1 add-to-tail 1 play-at \ post-processing
hsswl 4 4 4 inf overlap-texture
