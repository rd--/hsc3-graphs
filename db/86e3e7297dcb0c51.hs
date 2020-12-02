-- slew
let x = mouseX KR 200 12000 Exponential 0.2
    y = mouseY KR 200 12000 Exponential 0.2
in mce2 (slew (0 - saw AR 440) x y * 0.05) (slew (lfPulse AR 800 0 0.5) x y * 0.1)
