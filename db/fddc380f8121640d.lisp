; demand
(let* ((t (impulse kr 10 0))
       (r (dust kr 1))
       (s (dgeom dinf (midi-cps 72) (midi-ratio 1)))
       (f (demand t r s))
       (o (sin-osc ar (mce2 f (add f 0.7)) 0)))
  (mul (u:max (cubed o) 0) 0.1))
