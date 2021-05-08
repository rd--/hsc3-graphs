; Gendy1 ; modulate number of cps
(let* ((x (MouseX kr 1 13 0 0.1))
       (g (Gendy1 ar 1 1 1 1 440 660 0.5 0.5 12 x)))
  (Pan2 g 0 0.1))
