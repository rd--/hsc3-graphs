; Gt ; isStrictlyPositive
(let* ((a (Line -1 1 1 removeSynth))
       (isStrictlyPositive (lambda (a) (Gt a 0.0)))
       (b (isStrictlyPositive a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc f 0) 0.1))
