; sign
(let* ((a (Line -1 1 1 removeSynth))
       (b (Sign a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc f 0) 0.1))
