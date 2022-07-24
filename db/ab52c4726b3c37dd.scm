; Lag3
(let* ((x (MouseX 220 440 0 0.1))
       (f (Mce2 x (Lag3 x 1))))
  (Mul (SinOsc f 0) 0.1))
