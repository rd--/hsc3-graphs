; vibrato ; control depth and depthVariation
(let* ((n (MulAdd (LFNoise1 kr 1) 3 7))
       (x (MouseX kr 0 1 linear 0.2))
       (y (MouseY kr 0 1 linear 0.2))
       (v (Vibrato ar (DC ar 400) n x 1 1 y 0.1 0 0)))
  (Mul (SinOsc ar v 0) 0.1))
