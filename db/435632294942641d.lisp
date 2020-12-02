; latoocarfian-c ; randomly modulate all parameters
(mul (latoocarfian-c
      ar
      (f-div sample-rate 4)
      (mul-add (lf-noise2 kr 2) 1.5 1.5)
      (mul-add (lf-noise2 kr 2) 1.5 1.5)
      (mul-add (lf-noise2 kr 2) 0.5 1.5)
      (mul-add (lf-noise2 kr 2) 0.5 1.5)
      0.5
      0.5)
     0.05)
