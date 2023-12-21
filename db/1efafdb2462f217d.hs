-- bufRateScale ; requires=buf ; read without loop, trigger reset based on buffer duration
let b = control kr "buf" 100
    r = bufRateScale kr b
    p = phasor ar 0 r 0 (bufFrames kr b) 0
in bufRdL 1 ar b p NoLoop * 0.5
