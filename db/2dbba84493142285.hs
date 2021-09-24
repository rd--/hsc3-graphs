-- zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf ; id
let a z f = let fm = mce2 (randId (z,'α') 0.7 1.3) 1
                ph = mce2 (randId (z,'β') 0 two_pi) (randId (z,'γ') 0 two_pi)
            in mix (sinOsc ar (f * fm) ph * 0.1)
    a1 = max (a 'δ' (expRandId 'ε' 0.3 8)) 0
    a2 = abs (a 'ζ' (expRandId 'η' 6 24))
    o = sinOsc ar (midiCps (randId 'θ' 24 108)) (randId 'ι' 0 two_pi)
in pan2 (o * a1 * a2) (rand2Id 'κ' 1) 1
