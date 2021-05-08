; Convolution
(let* ((a 2048)
       (b (let ((v (make-vector a 0)))
            (vector-set! v 0 1)
            (replicate-m 100 (lambda () (vector-set! v (s:irand 0 a) (s:rand 0 1))))
            (as-local-buf (vector->list v)))))
  (Mul (Convolution
        (sound-in (mce2 0 1))
        (PlayBuf 1 ar b (BufRateScale kr b) 1 0 loop do-nothing)
        (* 2 a))
       0.2))
