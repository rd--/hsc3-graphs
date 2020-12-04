-- pv_BinScramble ; warning=feedback
let a = soundIn 0
    f = fft' (localBuf 'γ' 2048 1) a
    x = mouseX KR 0.15 1 Linear 0.1
    y = mouseY KR 0.15 1 Linear 0.1
    i = impulse KR (lfNoise0 'δ' KR 2 * 8 + 10) 0
    g = pv_BinScramble 'ε' f x y i
    h = ifft' g
in pan2 h 0 1
