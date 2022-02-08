-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    x = let ph = InFeedback 2 yn * [LFDNoise3 kr 1, LFDNoise3 kr 1]
        in Out xn (mceReverse (SinOsc ar (60 * 2) ph))
    y = let ph = InFeedback 2 xn * [LFDNoise3 kr 0.3, LFDNoise3 kr 0.3] * 4
        in Out yn (SinOsc ar (50 * 2) ph)
in Mrg3 (InFeedback 2 xn * 0.2) y x
