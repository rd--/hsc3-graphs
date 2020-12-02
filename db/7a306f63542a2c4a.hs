-- lfGauss ; modulate iphase
let ph = mouseX KR (-1) 1 Linear 0.2
    g = lfGauss AR 0.001 0.2 (mce2 0 ph) Loop DoNothing
in mix g * 0.2
