; LorenzL ; vary frequency
(let ((x (MouseX 20 (SampleRate) 0 0.1)))
  (Mul (LorenzL x 10 28 2.667 0.05 0.1 0 0) 0.10))
