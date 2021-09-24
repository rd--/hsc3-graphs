-- resonz ; modulate frequency
let f = xLine kr 1000 8000 10 RemoveSynth
in resonz (whiteNoise ar * 0.5) f 0.05
