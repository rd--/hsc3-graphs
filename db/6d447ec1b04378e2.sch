-- tremulate (jmcc) #1 ; texture=xfade,0.5,2,inf
let o = FSinOsc (Rand 500 900 * [1, 1.2, 1.5, 1.8]) 0
    a = Max 0 (LfNoise2 (RandN 4 30 90)) * 0.1
    l = RandN 4 (-1) 1
in Mix (Pan2 o l a)
