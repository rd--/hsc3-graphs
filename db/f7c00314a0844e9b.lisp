; log
(let* ((a (line ar -2 2 2 remove-synth))
       (b (u:log a))
       (f (mul-add (mce2 a b) 600 900)))
  (mul (sin-osc ar f 0) 0.1))
