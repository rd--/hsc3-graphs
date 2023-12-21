-- sweep ; using sweep to index into a buffer ; requires=buf
let (b, nc) = (control kr "buf" 100, 2)
    x = mouseX kr 0.5 20 Exponential 0.1
    t = impulse ar x 0
    p = sweep ar t (bufSampleRate kr b)
in bufRdL nc ar b p NoLoop
