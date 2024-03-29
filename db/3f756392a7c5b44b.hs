-- http://sccode.org/1-V (nv) L1 ; id
let a = mce2 (pinkNoiseId 'α' ar) (pinkNoiseId 'β' ar)
    nd z i =
        let n = lfNoise1Id (z,'γ') kr (randId (z,'δ') 0 0.05)
            f = linExp n (-1) 1 40 15000
        in bBandStop i f (expRandId (z,'ε') 0.1 2)
in lpf (useqId 'ζ' 50 nd a) 100000
