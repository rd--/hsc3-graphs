; EnvLinen ; (0.0 3 -1 -1 0.1 0.1 5.0 1 0.1 1 5.0 1)
(let* ((d (EnvLinen 0.1 1 0.5 0.1 (list 1 1)))
       (e (EnvGen 1 0.1 0 1 removeSynth d)))
 (Mul e (SinOsc 440 0)))
