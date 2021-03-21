; clustered sines (jmcc) #2 ; texture=xfade,4,4,inf
(let* ((n 80)
       (f (lambda ()
            (let* ((f1 (rand 100 1100))
                   (f2 (mul 4 f1))
                   (y (replicate-m n (lambda () (add f1 (rand 0 f2)))))
                   (z (klang-data y (map (lambda (e) (f-div f1 e)) y) (replicate n 0))))
              (klang ar 1 0 z)))))
  (mul (clone 2 f) (f-div 0.3 n)))
