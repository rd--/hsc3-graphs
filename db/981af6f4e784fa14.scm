; asLocalBuf ; BufRd
(let* ((nc 4)
       (b (asLocalBuf nc (listFill nc (lambda (x) (* (+ x 1) 110)))))
       (f (BufRd nc b (DC 0) 0 1)))
  (Splay (Mul (SinOsc f 0) 0.05) 1 1 0 #t))
