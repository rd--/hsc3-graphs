-- tBall ; x = sine modulation rate ; y = friction
let fr = mouseX KR 1 1000 Exponential 0.2
    h = mouseY KR 0.0001 0.001 Exponential 0.2
    g = lfNoise0 'α' KR 0.1 * 3 + 5
    f = tBall AR (sinOsc AR fr 0) g 0.01 h
in pan2 (ringz f 1400 0.04) 0 5
