; Dseq
(let* ((a (Dseq inf (RandN 32 0 10)))
       (t (Impulse (MouseX 1 10000 1 0.1) 0))
       (f (MulAdd (Demand t 0 a) 30 340)))
  (Mul (SinOsc f 0) 0.1))
