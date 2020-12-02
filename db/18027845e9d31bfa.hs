-- lpf ; control rate filtering
let ctl = lpf (lfPulse KR 8 0 0.5) (mouseX KR 2 50 Exponential 0.1)
in sinOsc AR (ctl * 200 + 400) 0 * 0.1
