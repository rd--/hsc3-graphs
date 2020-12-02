; gt ; is-strictly-positive
(let* ((a (line ar -1 1 1 remove-synth))
       (is-strictly-positive (lambda (a) (gt a 0.0)))
       (b (is-strictly-positive a))
       (f (mul-add (mce2 a b) 600 900)))
  (mul (sin-osc ar f 0) 0.1))
