-- sweep ; raising rate ; requires=buf
let x = mouseX KR 0.5 10 Exponential 0.1
    t = impulse AR x 0
    r = sweep t 2 + 0.5
    p = sweep t (bufSampleRate KR 0 * r)
in bufRdL 1 AR 0 p NoLoop
