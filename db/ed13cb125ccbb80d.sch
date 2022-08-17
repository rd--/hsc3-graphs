-- s-chirp (rd,  2006-10-08)
let x = MouseX 15 0 linear 0.1
    y = MouseY 15 27 linear 0.1
    t = cr (Dust 9)
    b = TChoose t [36, 48, 60, 72]
    n = LfNoise1 [3,  3.05] * 0.04
    d = TiRand x y t
    e = Decay2 t 0.005 (TRand 0.02 0.15 t)
    k = DegreeToKey (asLocalBuf [0, 2, 3.2, 5, 7, 9, 10]) d 12
    f = MidiCps (b + k + n)
    m = e * SinOsc f 0 * 0.2
    u = PulseDivider t 9 0
    r0 = TRand 0.0075 0.125 u
    r1 = TRand 0.05 0.15 u
in m * 0.5 + AllpassC m 0.15 r0 r1
