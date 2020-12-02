; r-delay-map ; simple feedback circuit (static)
(let ((b (clear-buf (local-buf 1 88200)))
      (d (make-mce (list -1  0  0 1
                         1/9 0  1  8/9
                         1   -1 0 1)))
      (pulse (lambda (f) (mul (decay (impulse ar f 0) 0.1) (mul (white-noise ar) 0.2)))))
  (r-delay-map b (pulse 5/4) 0 d))
