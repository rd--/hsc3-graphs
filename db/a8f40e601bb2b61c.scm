; StandardL ; frequency control
(let* ((x (MouseX kr 0.9 4 0 0.1))
       (f (MulAdd (StandardL ar 40 x 0.5 0) 800 900)))
  (Mul (SinOsc ar f 0) 0.05))
