; AmpCompA
(let* ((x (MouseX 300 15000 1 0.1))
       (y (MouseY 0 1 0 0.1))
       (o (Mul (SinOsc x 0) 0.1))
       (c (AmpCompA x 300 (DbAmp -10) 1)))
  (Mce2 (Mul o y) (Mul3 o (Sub 1 y) c)))
