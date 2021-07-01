-- pv_BinScramble ; warning=feedback
let a = soundIn 0
    f = fft' (localBufId 'γ' 2048 1) a
    x = mouseX kr 0.15 1 Linear 0.1
    y = mouseY kr 0.15 1 Linear 0.1
    i = impulse kr (lfNoise0Id 'δ' kr 2 * 8 + 10) 0
    g = pv_BinScrambleId 'ε' f x y i
    h = ifft' g
in pan2 h 0 1
