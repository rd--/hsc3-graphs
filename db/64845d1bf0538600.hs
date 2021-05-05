-- zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf
let a z f = let fm = mce2 (rand (z,'α') 0.7 1.3) 1
                ph = mce2 (rand (z,'β') 0 two_pi) (rand (z,'γ') 0 two_pi)
            in mix (sinOsc AR (f * fm) ph * 0.1)
    a1 = max (a 'δ' (expRand 'ε' 0.3 8)) 0
    a2 = abs (a 'ζ' (expRand 'η' 6 24))
    o = sinOsc AR (midiCPS (rand 'θ' 24 108)) (rand 'ι' 0 two_pi)
in pan2 (o * a1 * a2) (rand2 'κ' 1) 1
