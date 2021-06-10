; rand
(Mul (SinOsc ar (MulAdd (LFNoise1 kr (Add 6 (mceFill 2 (lambda (_) (Rand -4 4))))) 100 200) 0) 0.1)
