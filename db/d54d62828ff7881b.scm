; log
(let* ((a (Line -2 2 2 removeSynth))
       (b (Log a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc f 0) 0.1))
