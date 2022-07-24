; Sweep ; modulate sine frequency
(let* ((t (Impulse (MouseX 0.5 20 1 0.1) 0))
       (f (Add (Sweep t 700) 500)))
  (Mul (SinOsc f 0) 0.1))
