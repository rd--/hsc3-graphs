; Cubed
(let* ((a (Line ar -2 2 3 removeSynth))
       (b (Cubed a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc ar f 0) 0.05))
