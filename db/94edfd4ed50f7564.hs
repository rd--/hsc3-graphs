-- ; rLagC
let p = range 220 440 (lfPulse KR 0.1 0 0.5)
    x = mouseX KR (-8) 8 Linear 0.2
    y = mouseY KR (-8) 8 Linear 0.2
in sinOsc AR (mce2 p (X.rLagC p 0.75 x 1.5 y)) 0 * 0.1
