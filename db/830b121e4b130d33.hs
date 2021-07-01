-- atari2600
let x = mouseX kr 0 15 Linear 0.1
    o1 = sinOsc kr 0.35 0 * 7.5 + 7.5
    y = mouseY kr 0 31 Linear 0.1
    o2 = sinOsc kr 0.3 0 * 5.5 + 5.5
in X.atari2600 ar x o1 10 y o2 5 1
