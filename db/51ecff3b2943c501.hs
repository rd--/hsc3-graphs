-- bLowPass ; modulate reciprocal of Q
bLowPass (whiteNoise 'α' AR) 1200 (xLine KR 0.5 100 10 DoNothing) * 0.05
