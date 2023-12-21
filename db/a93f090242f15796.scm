; prts (rd)
(let* ((prt
        (lambda (f a)
          (let ((f* (Mul f
			 (Mul (LinLin (SinOsc (Rand 0.2 0.9) 0) -1 1 1 1.01)
                              (Rand 0.95 1.05)))))
            (Mul (SinOsc (Mce2 f f*) 0)
                 (Mul a (RandN 2 0.95 1.05))))))
       (prts
        (lambda (n f a)
          (Mix
           (map
            (lambda (f)
              (prt f a))
            (enumFromThenTo f (+ f f) (* n f)))))))
  (Add (! (lambda () (prts 2 900 0.002)) 2)
       (! (lambda () (prts 9 40 0.006)) 2)))
