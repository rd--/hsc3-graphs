-- playBuf ; requires=buf ; scan sequence of buffers
let n_buf = 61
    t = impulse kr 1 0
    b = mouseX kr 0 n_buf Linear 0.2
    r = bufRateScale kr b
in playBuf 1 ar b r t 0 Loop DoNothing * 0.5
