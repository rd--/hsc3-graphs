-- playBuf ; requires=buf ; sine wave control of playback rate, negative rate plays backwards
let (b, nc) = (control kr "buf" 100, 2)
    f = xLine kr 0.2 8 30 RemoveSynth
    r = fSinOsc kr f 0 * 3 + 0.6
    s = bufRateScale kr b * r
in playBuf nc ar b s 1 0 Loop DoNothing
