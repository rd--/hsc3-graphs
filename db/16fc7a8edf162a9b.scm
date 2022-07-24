; vibrato ; control depth and depthVariation
(let* ((n (MulAdd (LFNoise1 1) 3 7))
       (x (MouseX 0 1 linear 0.2))
       (y (MouseY 0 1 linear 0.2))
       (v (Vibrato (DC 400) n x 1 1 y 0.1 0 0)))
  (Mul (SinOsc v 0) 0.1))
