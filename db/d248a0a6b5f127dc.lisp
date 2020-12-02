; lt ; is-negative
(let* ((a (line ar -1 1 1 remove-synth))
       (is-negative (lambda (a) (lt a 0.0)))
       (b (is-negative a))
       (f (mul-add (mce2 a b) 600 900)))
  (mul (sin-osc ar f 0) 0.1))
