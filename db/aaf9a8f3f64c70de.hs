-- onsets ; generative signal with distinct onsets ; x varies threshold ; detector triggers noise
let e = linLin (saw ar 2) (-1) 1 0 1
    p = let f = midiCPS (tiRandId 'α' 63 75 (impulse kr 2 0)) in pulse ar f 0.5 * 0.1
    f = linExp (lfNoise2Id 'β' kr 0.5) (-1) 1 100 10000
    z = lpf p f * e
    c = fft' (localBufId 'γ' 1 512) z
    x = mouseX kr 0 1 Linear 0.2
    o = onsetsDefault c x (onsetType "rcomplex")
    n = let d = envPerc 0.001 0.1 in whiteNoiseId 'δ' ar * envGen kr o 0.2 0 1 DoNothing d
in pan2 z (-0.75) 0.2 + pan2 n 0.75 1
