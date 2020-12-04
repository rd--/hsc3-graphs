-- pv_BinScramble
let b = control KR "buf" 0
    a = playBuf 1 AR b (bufRateScale KR b) 1 0 Loop DoNothing
    f = fft' (localBuf 'α' 2048 1) a
    x = mouseX KR 0.0 1.0 Linear 0.1
    y = mouseY KR 0.0 1.0 Linear 0.1
    g = pv_BinScramble 'β' f x y (impulse KR 4 0)
in pan2 (ifft' g) 0 0.5
