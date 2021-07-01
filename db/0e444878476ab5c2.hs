-- lagUD ; as signal filter
let x = mouseX kr 0.0001 0.01 Exponential 0.2
    y = mouseY kr 0.0001 0.01 Exponential 0.2
in lagUD (lfPulse ar 800 0 0.5 * 2 - 1) x y * 0.05
