; limiter
(let* ((t (impulse ar 8 (mul (lf-saw kr 0.25 -0.6) 0.7)))
       (i (mul (decay2 t 0.001 0.3) (f-sin-osc ar 500 0))))
  (mce2 (mul i 0.1) (limiter i 0.2 0.01)))
