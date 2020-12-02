; demand
(let* ((mirror1 (lambda (l) (append l (cdr (reverse (cdr l))))))
       (t (impulse kr 24 0))
       (s (drand dinf (mce2 (dseq 1 (make-mce (mirror1 (enum-from-to 1 5))))
                            (drand 8 (make-mce (enum-from-to 4 11))))))
       (f (demand t 0 (mul s 100)))
       (x (mouse-x kr -1 1 0 0.1))
       (o (sin-osc ar (mce2 f (add f 0.7)) 0)))
  (mul (scale-neg (cubed (cubed o)) x) 0.1))
