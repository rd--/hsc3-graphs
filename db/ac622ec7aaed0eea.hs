-- zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf
let a f = let fm = mce2 (rand 0.7 1.3) 1
              ph = mce2 (rand 0 two_pi) (rand 0 two_pi)
          in mix (sinOsc ar (f * fm) ph * 0.1)
    a1 = max (a (expRand 0.3 8)) 0
    a2 = abs (a (expRand 6 24))
    o = sinOsc ar (midiCps (rand 24 108)) (rand 0 two_pi)
in pan2 (o * a1 * a2) (rand2 1) 1
