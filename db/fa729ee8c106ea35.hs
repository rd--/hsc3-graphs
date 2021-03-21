-- friction ; mouse control
let o = lag (sinOsc AR ((lfPulse KR 0.5 0 0.5 + lfPulse KR 0.33 0 0.5) * 440 + 220) 0) 0.1
    x = mouseX KR 0.00001 0.03 Exponential 0.2
    y = mouseY KR 0.2 10 Exponential 0.2
    s = X.friction AR o x 0.414 0.313 y 1.0
in (mce2 o s) * 0.5
