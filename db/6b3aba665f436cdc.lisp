; sweep ; modulate sine frequency
(let* ((t (impulse kr (mouse-x kr 0.5 20 1 0.1) 0))
       (f (add (sweep t 700) 500)))
  (mul (sin-osc ar f 0) 0.1))
