-- RShufflerL ; mouse control
let x = mouseX KR 0.0001 0.02 Linear 0.2
    y = mouseY KR 0.001 0.25 Linear 0.2
    o = sinOsc AR (mce2 440 441) 0 * 0.2
in X.rShufflerL o x y
