; LFTri ; used as both oscillator and lfo
(let ((f (MulAdd (LFTri 4 0) 400 400)))
  (Mul (LFTri f 0) 0.1))
