; lin-cong-c ; frequency control
(mul (sin-osc ar (mul-add (lin-cong-c
                           ar
                           40
                           (mul-add (lf-noise2 kr 0.1) 0.1 1.0)
                           (mul-add (lf-noise2 kr 0.1) 0.1 0.1)
                           (lf-noise2 kr 0.1)
                           0)
                          500 600) 0)
     0.1)
