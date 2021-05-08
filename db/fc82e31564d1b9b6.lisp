; rand
(Mul (SinOsc ar (MulAdd (LFNoise1 kr (Add 6 (mce-fill 2 (lambda (_) (Rand -4 4))))) 100 200) 0) 0.1)
