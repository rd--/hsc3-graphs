; scratchy (jmcc) #1
(let* ((n (Mul (BrownNoiseN 2) 0.5))
       (f (Mul (Max (Sub n 0.49) 0) 20)))
  (Rhpf f 5000 1))
