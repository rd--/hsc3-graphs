; Gendy1 ; near the corners are interesting
(let* ((x (MouseX kr 0 200 0 0.1))
       (y (MouseY kr 0 200 0 0.1))
       (p (LFPulse kr x 0 0.4))
       (s (Mul (SinOsc kr y 0) 0.5))
       (g (Gendy1 ar 6 6 p s 440 660 0.5 0.5 12 12)))
  (Pan2 g 0.0 0.1))
