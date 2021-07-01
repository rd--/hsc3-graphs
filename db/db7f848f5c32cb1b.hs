-- lagUD ; as signal filter
let x = mouseX kr 0.0001 0.01 Exponential 0.2
    y = mouseY kr 0.0001 0.01 Exponential 0.2
in lagUD (varSaw ar 220 0 (range 0 1 (sinOsc kr 0.25 0))) x y * 0.1
