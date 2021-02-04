; blip ; event control
(let ((f (lambda (g _x y z o _rx _ry p)
           (pan2 (blip ar (midi-cps p) (mul-add y 10 1)) (mul-add o 2 -1) (mul g z)))))
  (mul (mix (r-event-voicer 16 f)) (ctl kr "gain" 0.5)))
