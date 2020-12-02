; gendy1 ; play me
(let* ((x (mouse-x kr 100 1000 1 0.1))
       (g (gendy1 ar 2 3 1 1 20 x 0.5 0.0 40 40)))
  (pan2 (mul (rlpf g 500 0.3) 0.2) 0.0 0.1))
