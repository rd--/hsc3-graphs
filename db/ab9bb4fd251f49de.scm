; lag
(let* ((x (MouseX kr 220 440 0 0.1))
       (f (Mce2 x (Lag x 1))))
  (Mul (SinOsc ar f 0) 0.1))
