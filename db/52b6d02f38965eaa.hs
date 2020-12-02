-- ringz ; modulate ring time
let rt = xLine KR 4 0.04 8 RemoveSynth
in ringz (impulse AR 6 0.3) 2000 rt * 0.1
