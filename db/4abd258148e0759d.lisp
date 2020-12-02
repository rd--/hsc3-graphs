; env-trapezoid
(let* ((d (env-trapezoid 0 0.25 2 0.1))
       (e (env-gen kr 1 0.1 0 1 remove-synth d)))
  (mul e (sin-osc ar 440 0)))
