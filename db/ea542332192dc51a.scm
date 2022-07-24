; envTrapezoid
(let* ((d (envTrapezoid 0 0.25 2 0.1))
       (e (EnvGen 1 0.1 0 1 removeSynth d)))
  (Mul e (SinOsc 440 0)))
