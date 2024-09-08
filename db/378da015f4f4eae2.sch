-- http://sccode.org/1-4Qy (f0)
let f = SinOsc [1/8, 1/9] 0 * 4 + [400, 202]
    u = (SinOsc (1/9) 0 + 1) / 88
    d = (SinOsc (1/8) 0 + 1) / 99
    i = InFeedback 1 [1, 0]
    p = CombC (LagUD i u d) 1 0.08 9
in SinOsc f p * 0.15
