-- resonz ; modulate bandwidth opposite direction
let n = whiteNoise 'α' AR
    bw = xLine KR 0.001 1 8 RemoveSynth
in resonz (n * 0.5) 2000 bw
