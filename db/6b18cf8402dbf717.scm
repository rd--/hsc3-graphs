; EnvGen ; Mce at trigger input
(let* ((d (EnvPerc 0.01 1 1 (list -4 -4)))
       (t (Impulse (Mce2 3 5) 0))
       (e (EnvGen t 0.1 0 1 doNothing d)))
 (Mul e (SinOsc (TRand 220 440 t) 0)))
