-- lagUD ; as signal filter
let x = mouseX KR 0.0001 0.01 Exponential 0.2
    y = mouseY KR 0.0001 0.01 Exponential 0.2
in lagUD (0 - saw AR 440) x y * 0.15
