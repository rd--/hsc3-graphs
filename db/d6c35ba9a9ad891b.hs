-- lfGauss ; x=frequency, y=width ; note alisasing at high frequencies
let d = mouseX KR (1/8000) 0.1 Exponential 0.2
    w = mouseY KR 0.001 0.1 Exponential 0.2
in lfGauss AR d w 0 Loop DoNothing * 0.1
