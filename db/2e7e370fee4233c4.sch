-- https://twitter.com/redFrik/status/1125557217086857216 (f0)
let scl = [0, 2.94, 4.98, 7.02, 9.96]
    b = map (\x -> ((x + 0.7) * 2) / 666) [-7 .. 6]
    i = (LFTri kr b b * LFTri kr b 0 * 9 + 9) % 32
    m = DegreeToKey (asLocalBuf 1 scl) i 12 + 24
    o = VarSaw ar (MIDICPS m) 0 ((LFTri kr b 0 + 1) / 2) * AmpComp kr m 440 (1/3) * LFTri kr b b * b * 9
    s = RLPF o (Lag2 m ((1 / b) % 1) * 3) 1
in TanH (Splay (AllpassN s 0.3 (0.2 - b) 3) 1 1 0 True)
