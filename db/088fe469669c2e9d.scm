; lag3
(let* ((x (MouseX kr 220 440 0 0.1))
       (f (mce2 x (Lag3 x 1))))
  (Mul (SinOsc ar f 0) 0.1))
