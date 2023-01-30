; SinOsc
(Mul
 (SinOsc
  (Add
   (Mul
    (LfPulse
     (MulAdd (LfPulse 0.5 0.5 0.8) 1.5 0.5)
     0.0
     (range (SinOsc 0.15 0) 0.10 0.45))
    (range (SinOsc 0.2 0) 330 660))
   (Mul
    (LfPulse
     (MulAdd (LfPulse 0.25 0.0 0.2) 2.5 1)
     0.0
     (range (SinOsc 0.25 0) 0.15 0.35))
    (range (SinOsc 0.1 0) 110 770)))
  0)
 0.2)
