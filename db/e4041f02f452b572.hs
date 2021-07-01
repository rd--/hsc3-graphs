-- lagUD ; as signal filter
let x = mouseX kr 0.0001 0.01 Exponential 0.2
    y = mouseY kr 0.0001 0.01 Exponential 0.2
in lagUD (impulse ar (range 6 24 (lfNoise2Id 'α' kr 4)) 0) x y * 0.5
