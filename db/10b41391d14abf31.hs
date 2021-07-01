-- resonz ; modulate bandwidth
let n = whiteNoiseId 'α' ar
    bw = xLine kr 1 0.001 8 RemoveSynth
in resonz (n * 0.5) 2000 bw
