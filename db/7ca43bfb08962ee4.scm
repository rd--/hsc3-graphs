; lt ; is-negative
(let* ((a (Line ar -1 1 1 remove-synth))
       (is-negative (lambda (a) (LT a 0.0)))
       (b (is-negative a))
       (f (MulAdd (mce2 a b) 600 900)))
  (Mul (SinOsc ar f 0) 0.1))
