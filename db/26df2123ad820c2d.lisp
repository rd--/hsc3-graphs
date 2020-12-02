; gendy1 ; modulate number of cps
(let* ((x (mouse-x kr 1 13 0 0.1))
       (g (gendy1 ar 1 1 1 1 440 660 0.5 0.5 12 x)))
  (pan2 g 0 0.1))
