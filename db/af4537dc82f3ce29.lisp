; lorenz-l ; randomly modulate parameters
(mul (lorenz-l
      ar
      sample-rate
      (mul-add (lf-noise0 kr 1) 2 10)
      (mul-add (lf-noise0 kr 1) 20 38)
      (mul-add (lf-noise0 kr 1) 1.5 2)
      0.05
      0.1 0.0 0.0)
     0.1)
