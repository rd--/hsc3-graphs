; envTrapezoid
(let* ((d (envTrapezoid 0 0.25 2 0.1))
       (e (EnvGen kr 1 0.1 0 1 removeSynth d)))
  (Mul e (SinOsc ar 440 0)))
