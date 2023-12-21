; LfSaw ; used as both oscillator and lfo
(let ((f (MulAdd (LfSaw 4 0) 400 400)))
  (Mul (LfSaw f 0) 0.1))
