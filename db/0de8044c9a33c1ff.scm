; scratchy (jmcc) #1
(let* ((n (Mul (mceFill 2 (lambda (_) (BrownNoise ar))) 0.5))
       (f (Mul (Max (Sub n 0.49) 0) 20)))
  (RHPF f 5000 1))
