; SinOsc ; modulate freq
(let* ((f1 (XLn 1 1000 9))
       (f2 (MulAdd (SinOsc f1 0) 200 800)))
  (Mul (SinOsc f2 0) 0.1))
