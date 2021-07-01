-- resonz ; modulate bandwidth opposite direction
let n = whiteNoiseId 'α' ar
    bw = xLine kr 0.001 1 8 RemoveSynth
in resonz (n * 0.5) 2000 bw
