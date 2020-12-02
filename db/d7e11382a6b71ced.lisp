; gendy1 ; near the corners are interesting
(let* ((x (mouse-x kr 0 200 0 0.1))
       (y (mouse-y kr 0 200 0 0.1))
       (p (lf-pulse kr x 0 0.4))
       (s (mul (sin-osc kr y 0) 0.5))
       (g (gendy1 ar 6 6 p s 440 660 0.5 0.5 12 12)))
  (pan2 g 0.0 0.1))
