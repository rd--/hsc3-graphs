; coin-gate
(let* ((p 0.2)
       (t (mul (impulse ar 20 0) (add (sin-osc kr 0.5 0) 1)))
       (t* (t-exp-rand (mce2 1000 1000) 12000 t))
       (i (lambda () (coin-gate (add p (rand 0 0.1)) (mul t 0.1))))
       (s (lambda (_) (ringz (i) t* 0.01))))
 (mix-fill 3 s))
