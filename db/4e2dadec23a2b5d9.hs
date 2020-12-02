-- sweep ; backwards, variable offset ; requires=buf
let n = lfNoise0 'α' KR 15
    x = mouseX KR 0.5 10 Exponential 0.1
    t = impulse AR x 0
    r = bufSampleRate KR 0
    p = sweep t (negate r) + (bufFrames KR 0 * n)
in bufRdL 1 AR 0 p NoLoop
