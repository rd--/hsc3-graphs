-- resonz ; modulate bandwidth
let bw = xLine kr 1 0.001 8 RemoveSynth
in resonz (whiteNoise ar * 0.5) 2000 bw
