; babbling brook (jmcc) #SC3
(let* ((b (lambda (f m a g)
            (let* ((n1 (BrownNoise ar))
                   (n2 (BrownNoise ar))
                   (n3 (MulAdd (LPF n2 f) m a)))
              (Mul (RHPF (OnePole n1 0.99) n3 0.03) g)))))
  (Add (mceFill 2 (lambda (_) (b 14 400 500 0.024)))
       (mceFill 2 (lambda (_) (b 20 800 1000 0.040)))))
