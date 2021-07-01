-- sweep ; using sweep to index into a buffer ; requires=buf
let b = control kr "buf" 0
    x = mouseX kr 0.5 20 Exponential 0.1
    t = impulse ar x 0
    p = sweep t (bufSampleRate kr 0)
in bufRdL 1 ar 0 p NoLoop
