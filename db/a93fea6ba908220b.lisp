; env-coord ; co-ordinate based static envelope generator
(let* ((d (env-coord (list (cons 0 0)
                           (cons 0.75 1)
                           (cons 1 0))
                     1 1 (replicate 3 'linear)))
       (e (env-gen kr 1 0.1 0 1 remove-synth d)))
  (mul e (sin-osc ar 440 0)))
