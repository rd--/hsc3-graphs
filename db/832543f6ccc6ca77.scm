; harmonic swimming (jmcc) #1
(let* ((a 0.02)
       (l (line 0 (- a) 60 0))
       (o (lambda (h)
            (let* ((r (mceFill 2 (lambda (_) (s:rand 2 8))))
                   (n (lfnoise1 r))
                   (e (u:max 0 (muladd n a l))))
              (mul (fsinosc (* 50 h) 0) (kr: e))))))
  (mixFillOneIndexed 20 o))
