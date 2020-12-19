-- atari2600
let x = mouseX KR 0 15 Linear 0.1
    o1 = sinOsc KR 0.35 0 * 7.5 + 7.5
    y = mouseY KR 0 31 Linear 0.1
    o2 = sinOsc KR 0.3 0 * 5.5 + 5.5
in X.atari2600 x o1 10 y o2 5 1
