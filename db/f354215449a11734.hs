-- lagUD ; as signal filter
let x = mouseX kr 0.0001 0.01 Exponential 0.2
    y = mouseY kr 0.0001 0.01 Exponential 0.2
in lagUD (0 - saw ar 440) x y * 0.15
