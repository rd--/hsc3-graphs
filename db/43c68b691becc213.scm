; Gendy1 ; modulate distributions ; change of Pitch as distributions change the duration structure and spectrum
(let* ((x (MouseX 0 7 0 0.1))
       (y (MouseY 0 7 0 0.1))
       (g (Gendy1 x y 1 1 440 660 0.5 0.5 12 12)))
  (Pan2 g 0 0.1))
