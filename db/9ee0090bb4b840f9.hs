-- playBuf ; requires=buf ; scan sequence of buffers
let n_buf = 61
    t = impulse KR 1 0
    b = mouseX KR 0 n_buf Linear 0.2
    r = bufRateScale KR b
in playBuf 1 AR b r t 0 Loop DoNothing * 0.5
