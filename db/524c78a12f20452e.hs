-- resonz ; modulate bandwidth opposite direction
let bw = xLine kr 0.001 1 8 RemoveSynth
in resonz (whiteNoise ar * 0.5) 2000 bw
