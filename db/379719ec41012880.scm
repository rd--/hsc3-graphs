; lt ; is-negative
(let* ((a (Line -1 1 1 removeSynth))
       (is-negative (lambda (a) (Lt a 0.0)))
       (b (is-negative a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc f 0) 0.1))
