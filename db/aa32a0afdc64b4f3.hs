-- playBuf ; requires=buf ; trigger playback at each pulse (diminishing intervals)
let nc = 2
    b = control KR "buf" 0
    f = xLine KR 0.1 100 10 RemoveSynth
    t = impulse KR f 0
    s = bufRateScale KR b
in playBuf nc AR b s t 0 NoLoop DoNothing
