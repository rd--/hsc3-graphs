-- lagUD ; as signal filter
let x = mouseX KR 0.0001 0.01 Exponential 0.2
    y = mouseY KR 0.0001 0.01 Exponential 0.2
in lagUD (varSaw AR 220 0 (range 0 1 (sinOsc KR 0.25 0))) x y * 0.1
