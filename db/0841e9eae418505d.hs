-- RShufflerL ; mouse control
let x = mouseX kr 0.0001 0.02 Linear 0.2
    y = mouseY kr 0.001 0.25 Linear 0.2
    o = sinOsc ar (mce2 440 441) 0 * 0.2
in X.rShufflerL o x y
