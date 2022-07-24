-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    zn = 66
    x = let j = LinLin (LFNoise0 (log 2 / 2)) (-1) 1 1 30
            f = Select (kr j) [3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127]
            ph = InFeedback 2 zn * map (kr . LFDNoise3 . Sqrt) [1, 2]
        in Out xn (mceReverse (SinOsc (kr f) ph))
    y = let ph = InFeedback 2 xn * mceFill 2 (\_ -> LFDNoise1 (Sqrt pi)) * pi
        in Out yn (Tanh (SinOsc 19 ph) * exp 1)
    z = let ph = InFeedback 2 yn * mceFill 2 (\_ -> LFDNoise0 (Sqrt (Sqrt pi))) * 42 * pi
        in Out zn (Tanh (SinOsc 43 ph) * exp (-0.5 * pi))
in Mrg4 (InFeedback 2 xn) y x z * 0.1
