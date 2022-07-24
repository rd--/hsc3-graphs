; vibrato ; control rate and rateVariation
(let* ((x (MouseX 2 100 linear 0.2))
       (y (MouseY 0 1 linear 0.2))
       (v (Vibrato (DC 400) x 0.1 1 1 y 0.1 0 0)))
  (Mul (SinOsc v 0) 0.1))
