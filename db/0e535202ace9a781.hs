-- squiz ; of sin oscillator
let zmax = 10
    x = mouseX kr 1 10 Exponential 0.2
    y = mouseY kr 1 zmax Linear 0.2
in X.squiz (sinOsc ar 440 0) x y 0.1 * 0.1
