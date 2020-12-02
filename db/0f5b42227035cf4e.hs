-- bLowPass ; modulate center-frequency
bLowPass (whiteNoise 'α' AR) (xLine KR 24000 20 10 DoNothing) 1 * 0.05
