-- lpf ; control rate filtering
let ctl = lpf (lfPulse kr 8 0 0.5) (mouseX kr 2 50 Exponential 0.1)
in sinOsc ar (ctl * 200 + 400) 0 * 0.1
