-- http://sccode.org/1-4Qy (f0)
let z = SinOsc [1/8, 1/7] 0 * SinOsc (1/30) 0 * 9
    l = MidiCps [56, 62..98]
    m = SinOsc [1/4, 1/3] 0
    o = SinOsc (cr (Select z l)) 0 * m
in Tanh (CombN o 1 [1/6, 1/5] 9) * 0.1
