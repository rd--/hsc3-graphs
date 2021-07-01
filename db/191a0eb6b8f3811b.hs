-- pv_BinScramble
let b = control kr "buf" 0
    a = playBuf 1 ar b (bufRateScale kr b) 1 0 Loop DoNothing
    f = fft' (localBufId 'α' 2048 1) a
    x = mouseX kr 0.0 1.0 Linear 0.1
    y = mouseY kr 0.0 1.0 Linear 0.1
    g = pv_BinScrambleId 'β' f x y (impulse kr 4 0)
in pan2 (ifft' g) 0 0.5
