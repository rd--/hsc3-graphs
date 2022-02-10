; prts (rd)
(let* ((prt
        (lambda (f a)
          (let ((f* (Mul f (Mul (LinLin (SinOsc kr (Rand 0.2 0.9) 0) -1 1 1 1.01)
                                (Rand 0.95 1.05)))))
            (Mul (SinOsc ar (Mce2 f f*) 0)
                 (Mul a (RandN 2 0.95 1.05))))))
       (prts
        (lambda (n f a)
          (mixList
           (map
            (lambda (f)
              (prt f a))
            (enumFromThenTo f (+ f f) (* n f)))))))
  (Add (mixFill 2 (lambda (_) (prts 2 900 0.002)))
       (mixFill 2 (lambda (_) (prts 9 40 0.006)))))
