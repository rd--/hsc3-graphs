-- ccomb (rd, 2006-10-07)
let lwr = 48
    spart t _ = let n = range lwr 72.0 (lfNoise2 kr 0.1)
                    e = decay2 t 0.01 (tRand 0.05 0.75 t)
                    x = e * whiteNoise ar
                    f = lag (midiCps n) 0.25
                in combC x (recip (midiCps lwr)) (recip f) (range 1 8 (lfNoise2 kr 0.1))
    t = dust kr (mce2 0.75 0.35)
in mixFill 12 (spart t) * 0.01
