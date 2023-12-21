; clustered sines (jmcc) #2 ; texture=xfade,4,4,inf
(let* ((n 80)
       (f (lambda ()
            (let* ((f1 (Rand 100 1100))
                   (f2 (Mul 4 f1))
                   (y (! (lambda () (Add f1 (Rand 0 f2))) n))
                   (z (klangData y (map (lambda (e) (Div f1 e)) y) (! 0 n))))
              (Klang 1 0 z)))))
  (Mul (! f 2) (Div 0.3 n)))
