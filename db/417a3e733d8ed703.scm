; Gt ; cf. Ge Lt Le Eq
(let* ((o (SinOsc 1 0))
       (t (list (Gt o 0)
		(Ge o 0)
		(Lt o 0)
		(Le o 0)
		(Eq o 0)
		(Mul (Lt o 0.001) (Gt o -0.001))))
       (f (list 220
		330
		440
		550
		660
		770))
       (p (EnvPerc 0.01 1 1 (list -4 -4)))
       (e (EnvGen t 0.1 0 1 doNothing p)))
  (Mix (Mul (SinOsc f 0) e)))
