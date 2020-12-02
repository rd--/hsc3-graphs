; coin-gate
(let ((f (t-rand 300 400 (coin-gate 0.8 (impulse kr 10 0)))))
 (mul (sin-osc ar f 0) 0.1))
