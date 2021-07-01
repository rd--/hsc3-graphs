-- ringz ; modulate ring time
let rt = xLine kr 4 0.04 8 RemoveSynth
in ringz (impulse ar 6 0.3) 2000 rt * 0.1
