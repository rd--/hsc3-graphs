-- squiz ; of soundin
let zmax = 100
    s = sinOsc AR 440 0
    x = mouseX KR 1 10 Exponential 0.2
    y = mouseY KR 1 zmax Linear 0.2
in X.squiz (soundIn 0) x y 0.1 * 0.1
