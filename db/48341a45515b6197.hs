-- ringz ; modulate ring time opposite direction
let rt = xLine kr 0.04 4 8 RemoveSynth
in ringz (impulse ar 6 0.3) 2000 rt * 0.1
