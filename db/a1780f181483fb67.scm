; Fos ; same as one-pole
(let ((x (Mul (LfTri 0.4 0) 0.99))
      (i (Mul (LfSaw 200 0) 0.1)))
  (Fos i (Sub 1 (Abs x)) 0 x))
