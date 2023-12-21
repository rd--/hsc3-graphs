-- bufRateScale ; requires=buf ; bufRateScale = bufSampleRate / sampleRate
let b = control kr "buf" 100
    r = midiRatio (-5) * (bufSampleRate kr b / sampleRate)
    p = phasor ar 0 r 0 (bufFrames kr b) 0
in bufRdL 1 ar b p NoLoop * 0.5
