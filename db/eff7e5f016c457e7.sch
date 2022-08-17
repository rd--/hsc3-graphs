-- https://twitter.com/redFrik/status/1125557217086857216 (f0)
let scl = [0, 2.94, 4.98, 7.02, 9.96] -- pythagorean
    b = map (\x -> (x + 0.7) * 2 / 666) [-7 .. 6]
    i = (LFTri b b * LFTri b 0 * 9 + 9) % 32
    m = DegreeToKey (asLocalBuf scl) i 12 + 24
    o = VarSaw (MidiCps m) 0 ((LFTri b 0 + 1) / 2) * AmpComp m 440 (1 / 3) * LFTri b b * b * 9
    s = RLPF o (Lag2 m ((1 / b) % 1) * 3) 1
in Tanh (Splay (AllpassN s 0.3 (0.2 - b) 3) 1 1 0 True)
