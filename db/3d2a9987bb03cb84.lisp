; env-perc
(let* ((d (env-perc 0.01 1 1 (list -4 -4)))
       (e (env-gen kr (impulse kr 1 0) 0.1 0 1 do-nothing d)))
 (mul e (sin-osc ar 440 0)))
