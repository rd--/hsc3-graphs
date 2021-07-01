-- bLowPass ; modulate center-frequency
bLowPass (whiteNoiseId 'α' ar) (xLine kr 24000 20 10 DoNothing) 1 * 0.05
