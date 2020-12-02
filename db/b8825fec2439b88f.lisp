; gendy1 ; used as an lfo
(let* ((ad (mul-add (sin-osc kr 0.1 0) 0.49 0.51))
       (dd (mul-add (sin-osc kr 0.13 0) 0.49 0.51))
       (as (mul-add (sin-osc kr 0.17 0) 0.49 0.51))
       (ds (mul-add (sin-osc kr 0.19 0) 0.49 0.51))
       (g  (gendy1 kr 2 4 ad dd 3.4 3.5 as ds 10 10)))
  (pan2 (sin-osc ar (mul-add g 50 350) 0) 0.0 0.1))
