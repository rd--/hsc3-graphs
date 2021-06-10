-- http://sccode.org/1-4Qy (f0)
let f = sinosc [1/8, 1/9] 0 * 4 + [400, 202]
    u = (sinosc (1/9) 0 + 1) / 88
    d = (sinosc (1/8) 0 + 1) / 99
    i = infeedback 1 [1, 0]
    p = combc (lagud i u d) 1 0.08 9
in sinosc f p * 0.15
