-- pulse ; modulate width, 0.5 = square wave
let w = line kr 0.01 0.99 8 RemoveSynth
in pulse ar 200 w * 0.1
