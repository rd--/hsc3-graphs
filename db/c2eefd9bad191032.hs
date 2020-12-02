-- playBuf ; requires=buf ; trigger playback at each pulse
let nc = 2
    b = control KR "buf" 0
    t = impulse KR 2 0
    s = bufRateScale KR 0
in playBuf nc AR b s t 0 NoLoop DoNothing
