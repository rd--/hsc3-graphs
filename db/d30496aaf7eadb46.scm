; LFClipNoise ; as frequency control
(let ((f (MulAdd (LFClipNoise 4) 200 600)))
  (Mul (SinOsc f 0) 0.1))
