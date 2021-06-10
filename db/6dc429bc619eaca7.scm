; ge ; is positive
(let* ((a (Line ar -1 1 1 removeSynth))
       (isPositive (lambda (a) (GE a 0.0)))
       (b (isPositive a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc ar f 0) 0.1))
