; pulse-count
(let ((f (mul (pulse-count (impulse ar 10 0) (impulse ar 0.4 0)) 200)))
 (mul (sin-osc ar f 0) 0.05))
