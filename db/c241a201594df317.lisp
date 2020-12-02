; henon-n ; randomly modulate parameters
(mul (henon-n ar
              (f-div sample-rate 8)
              (mul-add (lf-noise2 kr 1) 0.20 1.20)
              (mul-add (lf-noise2 kr 1) 0.15 0.15)
              0
              0)
     0.05)
