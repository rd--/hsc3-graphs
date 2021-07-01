-- sweep ; raising rate ; requires=buf
let x = mouseX kr 0.5 10 Exponential 0.1
    t = impulse ar x 0
    r = sweep t 2 + 0.5
    p = sweep t (bufSampleRate kr 0 * r)
in bufRdL 1 ar 0 p NoLoop
