-- combC ; c.f. combN
let n = whiteNoise 'α' AR * 0.02
    dt = xLine KR 0.0001 0.01 20 RemoveSynth
in combC n 0.01 dt 0.2
