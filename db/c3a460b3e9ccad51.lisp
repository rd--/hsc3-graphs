; pulse-divider
(let* ((p (impulse ar 8 0))
       (d (pulse-divider p (mce2 4 7) 0))
       (a (mul (sin-osc ar 1200 0) (decay2 p 0.005 0.1)))
       (b (mul (sin-osc ar 600 0) (decay2 d 0.005 0.5))))
 (mul (add a b) 0.1))
