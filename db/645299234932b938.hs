-- bufDur ; requires=buf ; bufDur = bufFrames / bufSampleRate
let (b, nc) = (control kr "buf" 0, 2)
    t = impulse ar (bufSampleRate kr b / bufFrames kr b) 0
    p = sweep t (bufSampleRate kr b)
in bufRd nc ar b p NoLoop LinearInterpolation * 0.1
