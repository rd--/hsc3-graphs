; slope
(let* ((r 2)
       (a (LfNoise2 r)) ; quadratic noise
       (scale (Recip r))
       (b (Mul (Slope a) scale)) ; first derivative = Line segments
       (c (Mul (Slope b) (Squared scale))) ; second derivative = constant segments
       (o (SinOsc (MulAdd (Mce3 a b c) 220 220) 0)))
  (Mix (Mul o 0.1)))
