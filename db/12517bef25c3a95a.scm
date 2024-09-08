; ZeroCrossing
(let* ((a (Mul (SinOsc (MulAdd (SinOsc 1 0) 600 700) 0) 0.05))
       (b (Mul (Impulse (ZeroCrossing a) 0) 0.05)))
  (Mce2 a b))
