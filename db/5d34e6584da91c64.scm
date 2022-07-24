; trig
(let ((s (FSinOsc 800 0))
      (g (Trig (Dust 1) 0.2)))
  (Mul3 s g 0.1))
