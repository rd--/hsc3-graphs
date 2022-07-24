; sqrt
(let* ((a (Line -2 2 3 removeSynth))
       (b (Sqrt a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc f 0) 0.05))
