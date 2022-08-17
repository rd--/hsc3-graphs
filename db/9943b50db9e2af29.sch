-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    x = let ph = InFeedback 2 yn * [LFDNoise3 1, LFDNoise3 1]
        in Out xn (reverse (SinOsc (60 * 2) ph))
    y = let ph = InFeedback 2 xn * [LFDNoise3 0.3, LFDNoise3 0.3] * 4
        in Out yn (SinOsc (50 * 2) ph)
in Mrg3 (InFeedback 2 xn) y x * 0.1
