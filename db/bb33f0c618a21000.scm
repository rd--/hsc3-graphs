; LFClipNoise ; as frequency control
(let ((f (MulAdd (LFClipNoise kr 4) 200 600)))
  (Mul (SinOsc ar f 0) 0.1))
