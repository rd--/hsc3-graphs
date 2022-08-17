-- bufDur ; requires=buf ; read without loop, trigger reset based on buffer duration
let (b, nc) = (control kr "buf" 0, 2)
    t = impulse ar (recip (bufDur kr b)) 0
    p = sweep ar t (bufSampleRate kr b)
in bufRd nc ar b p NoLoop LinearInterpolation * 0.1
