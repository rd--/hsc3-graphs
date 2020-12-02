-- playBuf ; requires=buf ; sine wave control of playback rate, negative rate plays backwards
let nc = 2
    b = control KR "buf" 0
    f = xLine KR 0.2 8 30 RemoveSynth
    r = fSinOsc KR f 0 * 3 + 0.6
    s = bufRateScale KR b * r
in playBuf nc AR b s 1 0 Loop DoNothing
