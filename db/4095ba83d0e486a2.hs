-- squiz ; of buffer ; requires=buf
let (b, nc) = (control kr "buf" 0, 2)
    zmax = 100
    s = sinOsc ar 440 0
    x = mouseX kr 1 10 Exponential 0.2
    y = mouseY kr 1 zmax Linear 0.2
    r = bufRateScale kr b
    p = playBuf nc ar b (r * 0.5) 1 0 Loop DoNothing
in X.squiz p x y 0.1 * 0.1
