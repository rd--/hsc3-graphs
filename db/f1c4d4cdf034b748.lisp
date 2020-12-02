; prts (rd)
(let* ((wrp
        (lambda (i l r)
          (lin-lin i -1 1 l r)))
       (prt
        (lambda (f a)
          (let ((f* (mul f (mul (wrp (sin-osc kr (rand 0.2 0.9) 0) 1 1.01)
                                (rand 0.95 1.05)))))
            (mul (sin-osc ar (mce2 f f*) 0)
                 (mul a (rand-n 2 0.95 1.05))))))
       (prts
        (lambda (n f a)
          (mix
           (make-mce
            (map
             (lambda (f)
               (prt f a))
             (enum-from-then-to f (+ f f) (* n f))))))))
  (add (mix-fill 2 (lambda (_) (prts 2 900 0.002)))
       (mix-fill 2 (lambda (_) (prts 9 40 0.006)))))
