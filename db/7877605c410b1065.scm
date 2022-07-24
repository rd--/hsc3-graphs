; FOS ; same as one-pole
(let ((x (Mul (LFTri 0.4 0) 0.99))
      (i (Mul (LFSaw 200 0) 0.1)))
  (FOS i (Sub 1 (Abs x)) 0 x))
