; LfTri ; used as both oscillator and lfo
(let ((f (MulAdd (LfTri 4 0) 400 400)))
  (Mul (LfTri f 0) 0.1))
