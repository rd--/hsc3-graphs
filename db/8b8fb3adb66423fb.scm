; env-linen ; (0.0 3 -1 -1 0.1 0.1 5.0 1 0.1 1 5.0 1)
(let* ((d (env-linen 0.1 1 0.5 0.1 (list 1 1)))
       (e (EnvGen kr 1 0.1 0 1 remove-synth d)))
 (Mul e (SinOsc ar 440 0)))