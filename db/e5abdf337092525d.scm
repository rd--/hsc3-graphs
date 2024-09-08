; Wrap
(let ((o (Mul (SinOsc 440 0) 0.1))
      (l (Rand -0.1 -0.025))
      (r (Rand 0.025 0.1)))
  (Wrap o l r))
