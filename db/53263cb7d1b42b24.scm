; Rand ; kr
(Mul (SinOsc (kr: (MulAdd (LfNoise1 (Add 6 (! (lambda () (Rand -4 4)) 2))) 100 200)) 0) 0.1)
