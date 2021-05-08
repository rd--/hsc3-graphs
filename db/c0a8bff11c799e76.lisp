; lf-cub
(let ((f (MulAdd (LFCub kr (MulAdd (LFCub kr 0.2 0) 8 10) 0) 400 800)))
  (Mul (LFCub ar f 0) 0.1))
