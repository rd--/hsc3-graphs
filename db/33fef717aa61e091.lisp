; prts (rd)
(let* ((wrp
        (lambda (i l r)
          (lin-lin i -1 1 l r)))
       (prt
        (lambda (f a)
          (let ((f* (Mul f (Mul (wrp (SinOsc kr (Rand 0.2 0.9) 0) 1 1.01)
                                (Rand 0.95 1.05)))))
            (Mul (SinOsc ar (mce2 f f*) 0)
                 (Mul a (RRandN 2 0.95 1.05))))))
       (prts
        (lambda (n f a)
          (mix
           (make-mce
            (map
             (lambda (f)
               (prt f a))
             (enum-from-then-to f (+ f f) (* n f))))))))
  (Add (mix-fill 2 (lambda (_) (prts 2 900 0.002)))
       (mix-fill 2 (lambda (_) (prts 9 40 0.006)))))
