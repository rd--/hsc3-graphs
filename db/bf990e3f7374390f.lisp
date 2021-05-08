; env-perc
(let* ((d (env-perc 0.01 1 1 (list -4 -4)))
       (e (EnvGen kr (Impulse kr 1 0) 0.1 0 1 do-nothing d)))
 (Mul e (SinOsc ar 440 0)))
