-- squiz ; of sin oscillator
let zmax = 10
    x = mouseX KR 1 10 Exponential 0.2
    y = mouseY KR 1 zmax Linear 0.2
in X.squiz (sinOsc AR 440 0) x y 0.1 * 0.1