; dseq
(let* ((a (Dseq dinf (RandN 32 0 10)))
       (t (Impulse ar (MouseX kr 1 10000 1 0.1) 0))
       (f (MulAdd (Demand t 0 a) 30 340)))
  (Mul (SinOsc ar f 0) 0.1))
