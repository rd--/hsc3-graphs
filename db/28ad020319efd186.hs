-- bufRateScale ; requires=buf ; read buffer at ~ 3/4 reported sample rate
let b = control kr "buf" 100
    r = midiRatio (-5) * bufRateScale kr b
    p = phasor ar 0 r 0 (bufFrames kr b) 0
in bufRdL 1 ar b p NoLoop * 0.5
