; gendy1 ; texture
(let ((o (lambda (_)
           (let* ((f (rand 130.0 160.3))
                  (ad (mul-add (sin-osc kr 0.1 0) 0.49 0.51))
                  (dd (mul-add (sin-osc kr 0.13 0) 0.49 0.51))
                  (as (mul-add (sin-osc kr 0.17 0) 0.49 0.51))
                  (ds (mul-add (sin-osc kr 0.19 0) 0.49 0.51))
                  (g (gendy1 ar (rand 0 6) (rand 0 6) ad dd f f as ds 12 12)))
             (pan2 (sin-osc ar (mul-add g 200 400) 0) (rand -1 1) 0.1)))))
  (mix-fill 10 o))