; Convolution
(let* ((a 2048)
       (b (let ((v (make-vector a 0)))
            (vector-set! v 0 1)
            (replicateM 100 (lambda () (vector-set! v (rrand 0 a) (rand2 1.0))))
            (asLocalBuf (vector->list v)))))
  (Mul (Convolution
        (SoundIn (Mce2 0 1))
        (PlayBuf 1 b (BufRateScale b) 1 0 loop doNothing)
        (* 2 a))
       0.2))
