; blips 001 (jmcc) #SC3d1.5
(let ((pp (lambda (z)
            (let ((f (lambda (x) (AllpassN x 0.05 (Mce2 (Rand 0 0.05) (Rand 0 0.05)) 4))))
              (asMce (iterate 6 f (Distort z)))))))
  (pp
   (overlapTextureGraph
    2 1 12
    (lambda (tr)
      (let* ((tLine (lambda (st en du tr) (Phasor tr (Fdiv 1 du) st en st)))
             (tXline (lambda (st en du tr) (LinExp (tLine st en du tr) st en st en)))
             (tCoin (lambda (n tr) (Lt (TRand 0 1 tr) n)))
             (c (tCoin 0.8 tr))
             (b (lambda ()
                  (let ((f (tXline (TExpRand 0.25 400 tr) (TExpRand 0.25 400 tr) 4 tr))
                        (nh (tXline (TExpRand 2 100 tr) (TExpRand 2 100 tr) 4 tr)))
                    (Blip f nh)))))
        (Mul c (Pan2 (Mul (b) (b)) (tLine (TRand -1 1 tr) (TRand -1 1 tr) 4 tr) 0.3)))))))
