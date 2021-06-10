; RandSeed ; graph with Rand ugens
(let ((n (Add (Mul (WhiteNoise ar) (Mce2 0.05 0.05)) (Dust2 ar (Mce2 70 70))))
      (f (MulAdd (LFNoise1 kr 3) 5500 6000)))
  (Add (Resonz (Mul n 5) f 0.5) (Mul n 0.1)))
