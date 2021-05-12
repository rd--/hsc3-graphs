; LFTri ; used as both oscillator and lfo
(let ((f (MulAdd (LFTri kr 4 0) 400 400)))
  (Mul (LFTri ar f 0) 0.1))
