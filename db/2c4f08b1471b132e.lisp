; blips 001 (jmcc) #SC3d1.5
(let ((pp (lambda (z)
            (let ((f (lambda (x) (allpass-n x 0.05 (mce2 (rand 0 0.05) (rand 0 0.05)) 4))))
              (iterate-n 6 f (distort z))))))
  (pp
   (u:overlap-texture
    2 1 12
    (lambda (tr)
      (let* ((t-line (lambda (rt st en du tr) (phasor rt tr (f-div 1 du) st en st)))
             (t-x-line (lambda (rt st en du tr) (lin-exp (t-line rt st en du tr) st en st en)))
             (t-coin (lambda (n tr) (lt (t-rand 0 1 tr) n)))
             (c (t-coin 0.8 tr))
             (b (lambda ()
                  (let ((f (t-x-line kr (t-exp-rand 0.25 400 tr) (t-exp-rand 0.25 400 tr) 4 tr))
                        (nh (t-x-line kr (t-exp-rand 2 100 tr) (t-exp-rand 2 100 tr) 4 tr)))
                    (blip ar f nh)))))
        (mul c (pan2 (mul (b) (b)) (t-line kr (t-rand -1 1 tr) (t-rand -1 1 tr) 4 tr) 0.3)))))))
