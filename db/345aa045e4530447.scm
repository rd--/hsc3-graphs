; VarSaw
(let ((f (MulAdd (LfPulse (Mce2 3 3.03) 0 0.3) 200 200))
      (w (LinLin (LfTri 1 0) -1 1 0 1)))
  (Mul (VarSaw f 0 w) 0.1))
