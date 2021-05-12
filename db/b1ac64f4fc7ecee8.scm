; LorenzL ; frequency control
(let* ((x (MouseX kr 1 200 0 0.1))
       (c (LorenzL ar x 10 28 2.667 0.05 0.1 0 0)))
  (Mul (SinOsc ar (MulAdd (Lag c 0.003) 800 900) 0) 0.1))
