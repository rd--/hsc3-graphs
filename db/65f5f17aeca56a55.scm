; Gendy1 ; try durscale 10.0 and 0.0 too
(let* ((x (MouseX kr 10 700 0 0.1))
       (y (MouseY kr 50 1000 0 0.1))
       (g (Gendy1 ar 2 3 1 1 1 x 0.5 0.1 10 10)))
  (Pan2 (CombN (Resonz g y 0.1) 0.1 0.1 5) 0.0 0.1))
