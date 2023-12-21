; Gendy1 ; near the cornerse interesting
(let* ((x (MouseX 0 200 0 0.1))
       (y (MouseY 0 200 0 0.1))
       (p (LfPulse x 0 0.4))
       (s (Mul (SinOsc y 0) 0.5))
       (g (Gendy1 6 6 p s 440 660 0.5 0.5 12 12)))
  (Pan2 g 0.0 0.1))
