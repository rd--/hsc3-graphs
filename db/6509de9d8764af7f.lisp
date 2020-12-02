; slope
(let* ((r 2)
       (a (lf-noise2 kr r)) ; quadratic noise
       (scale (recip r))
       (b (mul (slope a) scale)) ; first derivative = line segments
       (c (mul (slope b) (squared scale))) ; second derivative = constant segments
       (o (sin-osc ar (mul-add (mce3 a b c) 220 220) 0)))
  (mix (mul o 0.1)))
