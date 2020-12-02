-- resonz ; modulate frequency
let n = whiteNoise 'α' AR
    f = xLine KR 1000 8000 10 RemoveSynth
in resonz (n * 0.5) f 0.05
