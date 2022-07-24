; AmpComp ; compare sine with and without compensation
(let* ((x (MouseX 300 15000 1 0.1))
       (y (MouseY 0 1 0 0.1))
       (o (Mul (SinOsc x 0) 0.1))
       (c (AmpComp o 300 0.333)))
  (Mce2 (Mul o y) (Mul3 o y c)))
