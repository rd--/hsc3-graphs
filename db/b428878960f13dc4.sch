-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    x = let ph = InFeedback 2 yn * mceFill 2 (\_ -> LFDNoise3 (sqrt 2))
        in Out xn (mceReverse (SinOsc 89 ph))
    y = let ph = InFeedback 2 xn * mceFill 2 (\_ -> LFDNoise3 (sqrt pi)) * pi
        in Out yn (Tanh (SinOsc 19 ph))
in Mrg3 (InFeedback 2 xn) y x * 0.1
