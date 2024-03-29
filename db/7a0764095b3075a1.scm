; AmpCompA ; adjust minimum and root (flatten Out the curve for higher amplitudes)
(let* ((x (MouseX 300 18000 1 0.1))
       (y (MouseY 0 1 0 0.1))
       (o (Mul (Formant 300 x 20) 0.1))
       (c (AmpCompA o 300 0.6 0.3)))
  (Mce2 (Mul o y) (Mul3 o (Sub 1 y) c)))
