; drand
(let ((f (lambda (u)
           (let* ((a (u dinf (make-mce (list 1 3 2 7 8))))
                  (t (Impulse kr (MouseX kr 1 400 1 0.1) 0))
                  (f (MulAdd (Demand t 0 a) 30 340)))
             (Mul (SinOsc ar f 0) 0.1)))))
  (mce2 (f Drand) (f Dxrand)))
