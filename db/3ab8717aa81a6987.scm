; asLocalBufInterleaved ; BufRd
(let* ((nc 4)
       (b (asLocalBufInterleaved nc (mceFill nc (lambda (x) (* (+ x 1) 110)))))
       (f (BufRd nc b (Dc 0) 0 1)))
  (Splay2 (Mul (SinOsc f 0) 0.05)))
