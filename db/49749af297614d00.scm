; trig
(let ((s (FSinOsc ar 800 0))
      (g (Trig (Dust ar 1) 0.2)))
  (Mul3 s g 0.1))
