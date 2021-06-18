-- http://www.listarc.bham.ac.uk/lists/sc-users/msg08240.html (jrhb)
let xn = 64
    yn = 65
    x = let ph = InFeedback 2 yn * [LFDNoise3 KR 1, LFDNoise3 KR 1]
        in Out xn (mceReverse (SinOsc AR (60 * 2) ph))
    y = let ph = InFeedback 2 xn * [LFDNoise3 KR 0.3, LFDNoise3 KR 0.3] * 4
        in Out yn (SinOsc AR (50 * 2) ph)
in Mrg3 (InFeedback 2 xn) y x
