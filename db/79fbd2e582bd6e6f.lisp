; env-gen
(let* ((d (env-perc 0.01 1 1 (list -4 -4)))
       (t (impulse kr (lin-lin (lf-noise2 kr 3) -1 1 1 9) 0))
       (e (env-gen kr t 0.1 0 1 do-nothing d)))
 (mul e (sin-osc ar (t-rand 220 440 t) 0)))
