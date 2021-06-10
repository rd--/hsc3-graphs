; drand
(let ((f (lambda (u)
           (let* ((a (u dinf (asMce (list 1 3 2 7 8))))
                  (t (Impulse kr (MouseX kr 1 400 1 0.1) 0))
                  (f (MulAdd (Demand t 0 a) 30 340)))
             (Mul (SinOsc ar f 0) 0.1)))))
  (Mce2 (f Drand) (f Dxrand)))
