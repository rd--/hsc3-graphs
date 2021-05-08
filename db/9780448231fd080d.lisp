; slope
(let* ((r 2)
       (a (LFNoise2 kr r)) ; quadratic noise
       (scale (Recip r))
       (b (Mul (Slope a) scale)) ; first derivative = Line segments
       (c (Mul (Slope b) (Squared scale))) ; second derivative = constant segments
       (o (SinOsc ar (MulAdd (mce3 a b c) 220 220) 0)))
  (mix (Mul o 0.1)))
