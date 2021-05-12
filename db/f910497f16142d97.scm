; babbling brook (jmcc) #SC3
(let* ((b (lambda (f m a g)
            (let* ((n1 (BrownNoise ar))
                   (n2 (BrownNoise ar))
                   (n3 (MulAdd (LPF n2 f) m a)))
              (Mul (RHPF (OnePole n1 0.99) n3 0.03) g)))))
  (Add (clone 2 (lambda () (b 14 400 500 0.024)))
       (clone 2 (lambda () (b 20 800 1000 0.040)))))
