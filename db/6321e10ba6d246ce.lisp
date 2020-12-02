; demand
(let* ((t (impulse kr 10 0))
       (s (midi-cps (diwhite dinf 60 72)))
       (f (demand t 0 s))
       (o (sin-osc ar (mce2 f (add f 0.7)) 0)))
  (mul (cubed (cubed o)) 0.1))
