; gendy1 ; scream!
(let ((x (mouse-x kr 220 440 1 0.1))
      (y (mouse-y kr 0.0 1.0 0 0.1)))
 (pan2 (gendy1 ar 2 3 1 1 x (mul 8 x) y y 7 7) 0.0 0.1))
