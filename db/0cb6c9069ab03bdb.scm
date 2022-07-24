; Gendy1 ; scream!
(let ((x (MouseX 220 440 1 0.1))
      (y (MouseY 0.0 1.0 0 0.1)))
 (Pan2 (Gendy1 2 3 1 1 x (Mul 8 x) y y 7 7) 0.0 0.1))
