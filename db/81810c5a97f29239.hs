-- sweep ; raising rate ; requires=buf
let (b, nc) = (control kr "buf" 0, 2)
    x = mouseX kr 0.5 10 Exponential 0.1
    t = impulse ar x 0
    r = sweep ar t 2 + 0.5
    p = sweep ar t (bufSampleRate kr b * r)
in bufRdL nc ar b p NoLoop
