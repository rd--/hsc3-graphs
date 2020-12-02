; convolution
(let* ((a 2048)
       (b (let ((v (make-vector a 0)))
            (vector-set! v 0 1)
            (replicate-m 100 (lambda () (vector-set! v (s:i-rand 0 a) (s:rand 0 1))))
            (as-local-buf (vector->list v)))))
  (mul (convolution
        (sound-in (mce2 0 1))
        (play-buf 1 ar b (buf-rate-scale kr b) 1 0 loop do-nothing)
        (* 2 a))
       0.2))
