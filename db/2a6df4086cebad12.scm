; env-coord ; co-ordinate based static envelope generator
(let* ((d (env-coord (list (cons 0 0)
                           (cons 0.75 1)
                           (cons 1 0))
                     1 1 (replicate 3 'linear)))
       (e (EnvGen kr 1 0.1 0 1 remove-synth d)))
  (Mul e (SinOsc ar 440 0)))
