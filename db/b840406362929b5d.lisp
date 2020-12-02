; lin-cong-c ; randomly modulate parameters
(mul (lin-cong-c
      ar
      (mul-add (lf-noise2 kr 1.0) 1e4 1e4)
      (mul-add (lf-noise2 kr 0.1) 0.5 1.4)
      (mul-add (lf-noise2 kr 0.1) 0.1 0.1)
      (lf-noise2 kr 0.1)
      0)
     0.1)
