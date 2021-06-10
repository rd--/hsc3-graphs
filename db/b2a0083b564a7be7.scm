; scratchy (jmcc) #1
(let* ((n (mul (mceFill 2 (lambda (_) (brownnoise))) 0.5))
       (f (mul (u:max (sub n 0.49) 0) 20)))
  (rhpf f 5000 1))
