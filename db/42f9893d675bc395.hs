-- friction ; control rate
let s = lfPar KR 33 0 + mouseX KR 0.01 10 Exponential 0.2
    y = mouseY KR 0 1 Linear 0.2
    o = X.friction KR s 0.0000541322 y 0.318 8.05501 1.0
in pan2 (sinOsc AR (o * 350 + 150) 0) 0 0.1
