; gt ; is-strictly-positive
(let* ((a (Line ar -1 1 1 remove-synth))
       (is-strictly-positive (lambda (a) (GT a 0.0)))
       (b (is-strictly-positive a))
       (f (MulAdd (mce2 a b) 600 900)))
  (Mul (SinOsc ar f 0) 0.1))
