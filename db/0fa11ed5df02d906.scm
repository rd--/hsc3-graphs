; klink (rd)
(let* ((n1 (LFNoise0 kr (Mce2 0.5 1.5)))
       (o (SinOsc kr n1 0))
       (f (Mce2 2 3))
       (a (Mul (Abs (Slope o)) f))
       (t (Impulse ar a 0))
       (i (Decay2 t 0.01 0.1))
       (x (MouseX kr 960 3620 1 0.1))
       (y (MouseY kr 0.5 2.0 0 0.2))
       (n2 (TRand x 3940 t))
       (n3 (TRand 0.005 0.275 t)))
  (Ringz i n2 (Mul n3 y)))