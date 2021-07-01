-- bLowPass ; modulate reciprocal of Q
bLowPass (whiteNoiseId 'α' ar) 1200 (xLine kr 0.5 100 10 DoNothing) * 0.05
