-- lfGauss ; x=frequency, y=width ; note alisasing at high frequencies
let d = mouseX kr (1/8000) 0.1 Exponential 0.2
    w = mouseY kr 0.001 0.1 Exponential 0.2
in lfGauss ar d w 0 Loop DoNothing * 0.1
