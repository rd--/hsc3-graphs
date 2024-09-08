-- bowed string (jmcc) ; texture=overlap,5,2,12,inf
let root = 5
    scale = map (+ root) [0, 2, 4, 5, 7, 9, 11]
    oct = [24, 36, 48, 60, 72, 84]
    f = MidiCps (choose scale + choose oct)
    x = [BrownNoise (), BrownNoise ()] * 0.007 * max 0 (LfNoise1 (ExpRand 0.125 0.5) * 0.6 + 0.4)
    geom n i z = iterate n (* z) i
    iota n i z = iterate n (+ z) i
    k = RingzBank x (iota 12 f f) (geom 12 1 (Rand 0.7 0.9)) (RandN 12 1.0 3.0)
in SoftClip (k * 0.1)
