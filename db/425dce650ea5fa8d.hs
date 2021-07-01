-- tBall ; x = friction ; y = gravity
let fr = linExp (sinOsc kr 0.1 0) (-1) 1 1 600
    h = mouseY kr 0.0001 0.001 Exponential 0.2
    g = mouseX kr 1 10 Exponential 0.2
    f = tBall ar (sinOsc ar fr 0) g 0.01 h
in pan2 (ringz f 1400 0.04) 0 5
