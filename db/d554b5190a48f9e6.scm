; 20061023 (rd)
(let* ((n1 (LfNoise0 (Mce2 0.5 1.5)))
       (o (SinOsc n1 0))
       (f (Mce2 2 3))
       (a (Mul (Abs (Slope o)) f))
       (t (Impulse a 0))
       (i (Decay2 t 0.01 0.1))
       (x (MouseX 960 3620 1 0.1))
       (y (MouseY 0.5 2.0 0 0.2))
       (n2 (TRand x 3940 t))
       (n3 (TRand 0.005 0.275 t)))
  (Ringz i n2 (Mul n3 y)))
