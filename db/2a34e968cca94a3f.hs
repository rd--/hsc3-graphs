-- random panning sines (jmcc) #4 ; texture=overlap,8,8,2,inf
let nd _ = pan2 (fSinOsc ar (linRand 80 2000 0) 0) (lfNoise1 kr (rand 0.8 1.2)) (lfNoise1 kr (rand 0.82 0.98))
in mixFill 8 nd * (0.4 / 8)
