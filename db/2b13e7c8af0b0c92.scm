; Gendy1 ; play me
(let* ((x (MouseX 100 1000 1 0.1))
       (g (Gendy1 2 3 1 1 20 x 0.5 0.0 40 40)))
  (Pan2 (Mul (RLPF g 500 0.3) 0.2) 0.0 0.1))
