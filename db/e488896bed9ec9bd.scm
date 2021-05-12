; lfdClipNoise ; c.f. lfclipnoise
(let ((f (MulAdd (LFDClipNoise ar (MouseX kr 0.1 1000 1 0.1)) 200 500)))
  (Mul (SinOsc ar f 0) 0.1))
