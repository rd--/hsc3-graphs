; fold
(let ((o (Mul (SinOsc ar 440 0) 0.1))
      (l (Rand -0.1 -0.025))
      (r (Rand 0.025 0.1)))
  (Fold o l r))
