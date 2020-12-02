; dgeom ; demand rate ugens are not shared
(let* ((a  (dgeom 15 1 1.2))
       (t  (impulse ar (mouse-x kr 1 40 1 0.1) 0))
       (f0 (mul-add (demand (delay1 t) 0 a) 30 340))
       (f1 (mul-add (demand t 0 a) 30 340)))
  (mul (sin-osc ar (mce2 f0 f1) 0) 0.1))
