-- formlet ; mouse control of frequency and decay time
let s = blip ar (sinOsc kr 5 0 * 20 + 300) 1000 * 0.1
    x = mouseX kr 0.01 0.2 Exponential 0.2
    y = mouseY kr 700 2000 Exponential 0.2
in formlet s y 0.005 x
