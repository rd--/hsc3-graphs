; grain-in
(let* ((x (mouse-x kr -0.5 0.5 0 0.1))
       (y (mouse-y kr 5 25 0 0.1))
       (n (pink-noise ar))
       (t (impulse kr y 0)))
  (mul (grain-in 2 t 0.1 n x -1 512) 0.1))
