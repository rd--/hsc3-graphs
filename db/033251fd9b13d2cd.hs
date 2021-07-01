-- sweep ; backwards, variable offset ; requires=buf
let n = lfNoise0Id 'α' kr 15
    x = mouseX kr 0.5 10 Exponential 0.1
    t = impulse ar x 0
    r = bufSampleRate kr 0
    p = sweep t (negate r) + (bufFrames kr 0 * n)
in bufRdL 1 ar 0 p NoLoop
