-- resonz ; modulate bandwidth
let n = whiteNoise 'α' AR
    bw = xLine KR 1 0.001 8 RemoveSynth
in resonz (n * 0.5) 2000 bw
