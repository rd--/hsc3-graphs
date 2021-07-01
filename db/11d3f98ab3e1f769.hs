-- friction ; control rate
let s = lfPar kr 33 0 + mouseX kr 0.01 10 Exponential 0.2
    y = mouseY kr 0 1 Linear 0.2
    o = X.friction kr s 0.0000541322 y 0.318 8.05501 1.0
in pan2 (sinOsc ar (o * 350 + 150) 0) 0 0.1
