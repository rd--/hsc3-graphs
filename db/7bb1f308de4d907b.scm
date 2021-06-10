; varsaw
(let ((f (MulAdd (LFPulse kr (Mce2 3 3.03) 0 0.3) 200 200))
      (w (LinLin (LFTri kr 1 0) -1 1 0 1)))
  (Mul (VarSaw ar f 0 w) 0.1))
