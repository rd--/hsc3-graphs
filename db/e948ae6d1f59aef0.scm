; SinOsc ; modulate phase
(let* ((f (XLn 20 8000 10))
       (p (Mul (SinOsc f 0) (* pi 2))))
  (Mul (SinOsc 800 p) 0.1))
