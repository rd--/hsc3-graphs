-- http://sccode.org/1-V (nv) L1
let a = mceFill 2 (\_ -> pinkNoise ar)
    nd i =
        let n = lfNoise1 kr (rand 0 0.05)
            f = linExp n (-1) 1 40 15000
        in bBandStop i f (expRand 0.1 2)
in lpf (iter 50 nd a) 100000
