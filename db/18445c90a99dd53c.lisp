; zero-crossing
(let* ((a (mul (sin-osc ar (mul-add (sin-osc kr 1 0) 600 700) 0) 0.05))
       (b (mul (impulse ar (zero-crossing a) 0) 0.05)))
  (mce2 a b))
