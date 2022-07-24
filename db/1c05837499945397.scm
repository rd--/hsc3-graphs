; LFPar ; c.f. lfcub
(let ((f (MulAdd (LFPar (MulAdd (LFPar 0.2 0) 8 10) 0) 400 800)))
  (Mul (LFPar f 0) 0.1))
