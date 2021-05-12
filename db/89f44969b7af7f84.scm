; env-trapezoid
(let* ((d (env-trapezoid 0 0.25 2 0.1))
       (e (EnvGen kr 1 0.1 0 1 remove-synth d)))
  (Mul e (SinOsc ar 440 0)))
