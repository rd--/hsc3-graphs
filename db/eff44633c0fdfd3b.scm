; EnvGen ; mce at trigger input
(let* ((d (env-perc 0.01 1 1 (list -4 -4)))
       (t (Impulse kr (mce2 3 5) 0))
       (e (EnvGen kr t 0.1 0 1 do-nothing d)))
 (Mul e (SinOsc ar (TRand 220 440 t) 0)))
