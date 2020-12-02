; dibrown ; c.f. dbrown
(let* ((a (dibrown dinf 0 15 1))
       (t (impulse kr (mouse-x kr 1 40 1 0.1) 0))
       (f (mul-add (demand t 0 a) 30 340)))
  (mul (sin-osc ar f 0) 0.05))
