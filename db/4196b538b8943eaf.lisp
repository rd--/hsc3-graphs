; LFSaw ; used as both oscillator and lfo
(let ((f (MulAdd (LFSaw kr 4 0) 400 400)))
  (Mul (LFSaw ar f 0) 0.1))
