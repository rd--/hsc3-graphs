; demand
(let* ((mirror1 (lambda (l) (append l (cdr (reverse (cdr l))))))
       (t (Impulse kr 24 0))
       (s (Drand dinf (mce2 (Dseq 1 (make-mce (mirror1 (enum-from-to 1 5))))
                            (Drand 8 (make-mce (enum-from-to 4 11))))))
       (f (Demand t 0 (Mul s 100)))
       (x (MouseX kr -1 1 0 0.1))
       (o (SinOsc ar (mce2 f (Add f 0.7)) 0)))
  (Mul (ScaleNeg (Cubed (Cubed o)) x) 0.1))