-- resonz ; modulate frequency
let n = whiteNoiseId 'α' ar
    f = xLine kr 1000 8000 10 RemoveSynth
in resonz (n * 0.5) f 0.05
