; blips 001 (jmcc) #SC3d1.5
(let ((pp (lambda (z)
            (let ((f (lambda (x) (AllpassN x 0.05 (mce2 (Rand 0 0.05) (Rand 0 0.05)) 4))))
              (iterate-n 6 f (Distort z))))))
  (pp
   (u:overlap-texture
    2 1 12
    (lambda (tr)
      (let* ((t-line (lambda (rt st en du tr) (Phasor rt tr (FDiv 1 du) st en st)))
             (t-xline (lambda (rt st en du tr) (LinExp (t-line rt st en du tr) st en st en)))
             (t-coin (lambda (n tr) (LT (TRand 0 1 tr) n)))
             (c (t-coin 0.8 tr))
             (b (lambda ()
                  (let ((f (t-xline kr (TExpRand 0.25 400 tr) (TExpRand 0.25 400 tr) 4 tr))
                        (nh (t-xline kr (TExpRand 2 100 tr) (TExpRand 2 100 tr) 4 tr)))
                    (Blip ar f nh)))))
        (Mul c (Pan2 (Mul (b) (b)) (t-line kr (TRand -1 1 tr) (TRand -1 1 tr) 4 tr) 0.3)))))))
