; LfClipNoise
(let ((f (MulAdd (LfClipNoise (MouseX 0.1 1000 1 0.1)) 200 500)))
  (Mul (SinOsc f 0) 0.1))
