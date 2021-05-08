; zerocrossing
(let* ((a (Mul (SinOsc ar (MulAdd (SinOsc kr 1 0) 600 700) 0) 0.05))
       (b (Mul (Impulse ar (ZeroCrossing a) 0) 0.05)))
  (mce2 a b))
