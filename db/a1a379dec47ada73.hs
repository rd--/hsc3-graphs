-- squiz ; of soundin
let zmax = 100
    s = sinOsc ar 440 0
    x = mouseX kr 1 10 Exponential 0.2
    y = mouseY kr 1 zmax Linear 0.2
in X.squiz (soundIn 0) x y 0.1 * 0.1
