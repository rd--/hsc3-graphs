; tw-index ; modulating probability values
(let* ((t (impulse kr 6 0))
       (a (mce3 1/4 1/2 (mul-add (sin-osc kr 0.3 0) 0.5 0.5)))
       (f (select (tw-index t 1.0 a) (mce3 400 500 600))))
  (mul (sin-osc ar f 0) 0.2))
