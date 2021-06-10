; gt ; is-strictly-positive
(let* ((a (Line ar -1 1 1 removeSynth))
       (is-strictly-positive (lambda (a) (GT a 0.0)))
       (b (is-strictly-positive a))
       (f (MulAdd (Mce2 a b) 600 900)))
  (Mul (SinOsc ar f 0) 0.1))
