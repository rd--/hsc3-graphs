; Ge ; is positive
(let* ((a (Line -1 1 1 removeSynth))
       (isPositive (lambda (a) (Ge a 0.0)))
       (b (isPositive a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc f 0) 0.1))
