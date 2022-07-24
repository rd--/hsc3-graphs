; Lag2
(let* ((x (MouseX 220 440 0 0.1))
       (f (Mce2 x (Lag2 x 1))))
  (Mul (SinOsc f 0) 0.1))
