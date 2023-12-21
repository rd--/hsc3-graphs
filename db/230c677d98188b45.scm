; Drand
(let ((f (lambda (u)
           (let* ((a (u inf (list 1 3 2 7 8)))
                  (t (Impulse (MouseX 1 400 1 0.1) 0))
                  (f (MulAdd (Demand t 0 a) 30 340)))
             (Mul (SinOsc f 0) 0.1)))))
  (Mce2 (f Drand) (f Dxrand)))
