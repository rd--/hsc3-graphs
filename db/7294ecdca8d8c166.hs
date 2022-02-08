-- bufFrames ; requires=buf ; read without loop, trigger reset based on buffer duration
let (b, nc) = (control kr "buf" 0, 2)
    p = phasor ar 0 (bufRateScale kr b) 0 (bufFrames kr b) 0
in bufRdL nc ar b p NoLoop * 0.1
