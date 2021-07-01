-- playBuf ; requires=buf ; trigger playback at each pulse
let nc = 2
    b = control kr "buf" 0
    t = impulse kr 2 0
    s = bufRateScale kr 0
in playBuf nc ar b s t 0 NoLoop DoNothing
