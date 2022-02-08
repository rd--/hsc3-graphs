-- playBuf ; requires=buf ; trigger playback at each pulse (diminishing intervals)
let (b, nc) = (control kr "buf" 0, 2)
    f = xLine kr 0.1 100 10 RemoveSynth
    t = impulse kr f 0
    s = bufRateScale kr b
in playBuf nc ar b s t 0 NoLoop DoNothing
