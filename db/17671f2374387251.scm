; LorenzL ; vary frequency
(let ((x (MouseX kr 20 SampleRate 0 0.1)))
  (Mul (LorenzL ar x 10 28 2.667 0.05 0.1 0 0) 0.10))
