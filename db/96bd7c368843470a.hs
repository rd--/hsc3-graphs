-- ramp ; mouse control
let x1 = mouseX KR 220 440 Exponential 0
    x2 = ramp x1 (300 / 1000)
in sinOsc AR (mce2 x1 x2) 0 * 0.1
