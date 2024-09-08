; SinOsc ; c.f. LfCub
(let ((f (MulAdd (SinOsc (MulAdd (SinOsc 0.2 0) 8 10) 0) 400 800)))
  (Mul (SinOsc f 0) 0.1))
