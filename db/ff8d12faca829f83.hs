-- pv_MagFreeze ; mouseX is trigger to freeze
let b = control KR "buf" 0
    z = playBuf 1 AR b (bufRateScale KR b) 0 0 Loop DoNothing
    f = fft' (localBuf 'α' 2048 1) z
    x = mouseX KR 0 1 Linear 0.1
    h = pv_MagFreeze f (x >** 0.5)
in ifft' h * 0.5
