; LFSaw ; used as both oscillator and lfo
(let ((f (MulAdd (LFSaw 4 0) 400 400)))
  (Mul (LFSaw f 0) 0.1))
