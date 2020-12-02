-- localBuf ; Variant with two local buffers
let dup (p,q) f = mce2 (f p) (f q)
    n = dup ('α','β') (\z -> whiteNoise z AR)
    b = dup ('γ','δ') (\z -> localBuf z 1 2048)
    f = fft' b n
    c = pv_BrickWall f (sinOsc KR (mce2 0.1 0.11) 0 * 0.75)
in ifft' c * 0.1
