; Gendy1 ; self modulation
(let* ((x  (MouseX 1 13 0 0.1))
       (y  (MouseY 0.1 10 0 0.1))
       (g0 (Gendy1 5 4 0.3 0.7 0.1 y 1.0 1.0 5 5))
       (g1 (Gendy1 1 1 1 1 440 (MulAdd g0 500 600) 0.5 0.5 12 x)))
  (Pan2 g1 0.0 0.1))
