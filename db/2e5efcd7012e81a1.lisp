; gendy1 ; try durscale 10.0 and 0.0 too
(let* ((x (mouse-x kr 10 700 0 0.1))
       (y (mouse-y kr 50 1000 0 0.1))
       (g (gendy1 ar 2 3 1 1 1 x 0.5 0.1 10 10)))
  (pan2 (comb-n (resonz g y 0.1) 0.1 0.1 5) 0.0 0.1))
