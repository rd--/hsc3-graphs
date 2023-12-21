-- sweep ; backwards, variable offset ; requires=buf
let (b, nc) = (control kr "buf" 100, 2)
    n = lfNoise0Id 'α' kr 15
    x = mouseX kr 0.5 10 Exponential 0.1
    t = impulse ar x 0
    r = bufSampleRate kr b
    p = sweep ar t (negate r) + (bufFrames kr b * n)
in bufRdL nc ar b p NoLoop
