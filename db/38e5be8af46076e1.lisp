; scratchy (jmcc) #1
(let* ((n (Mul (clone 2 (lambda () (BrownNoise))) 0.5))
       (f (Mul (Max (Sub n 0.49) 0) 20)))
  (RHPF f 5000 1))
