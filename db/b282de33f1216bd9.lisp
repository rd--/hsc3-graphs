; log10
(let* ((a (line ar -2 2 3 remove-synth))
       (b (log10 a))
       (f (mul-add (mce2 a b) 600 900)))
  (mul (sin-osc ar f 0) 0.1))
