; clustered sines (jmcc) #2 ; texture=xfade,4,4,inf
(let* ((n 80)
       (f (lambda ()
            (let* ((f1 (Rand 100 1100))
                   (f2 (Mul 4 f1))
                   (y (replicateM n (lambda () (Add f1 (Rand 0 f2)))))
                   (z (klang-data y (map (lambda (e) (FDiv f1 e)) y) (replicate n 0))))
              (Klang ar 1 0 z)))))
  (Mul (clone 2 f) (FDiv 0.3 n)))
