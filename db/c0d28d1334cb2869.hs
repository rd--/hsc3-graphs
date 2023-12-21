-- bufRateScale ; requires=buf ; bufRateScale = bufSampleRate * sampleDur
let b = control kr "buf" 100
    r = midiRatio (-5) * (bufSampleRate kr b * sampleDur)
    p = phasor ar 0 r 0 (bufFrames kr b) 0
in bufRdL 1 ar b p NoLoop * 0.5
