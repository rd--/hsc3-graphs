-- lagUD ; as signal filter
let x = mouseX KR 0.0001 0.01 Exponential 0.2
    y = mouseY KR 0.0001 0.01 Exponential 0.2
in lagUD (impulse AR (range 6 24 (lfNoise2 'α' KR 4)) 0) x y * 0.5
