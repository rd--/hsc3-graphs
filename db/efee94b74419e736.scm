; SinOsc ; modulate freq
(let ((f (XLn 2000 200 1)))
  (Mul (SinOsc f 0) 0.1))
