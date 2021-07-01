-- slew
let x = mouseX kr 200 12000 Exponential 0.2
    y = mouseY kr 200 12000 Exponential 0.2
in mce2 (slew (0 - saw ar 440) x y * 0.05) (slew (lfPulse ar 800 0 0.5) x y * 0.1)
