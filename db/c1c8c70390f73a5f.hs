-- sweep ; using sweep to index into a buffer ; requires=buf
let b = control KR "buf" 0
    x = mouseX KR 0.5 20 Exponential 0.1
    t = impulse AR x 0
    p = sweep t (bufSampleRate KR 0)
in bufRdL 1 AR 0 p NoLoop
