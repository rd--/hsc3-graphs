; harmonic tumbling (jmcc) #1
(let* ((f 80)
       (p 10)
       (t (XLine kr (Mce2 10 11) 0.1 60 0))
       (o (lambda (h)
            (let* ((n (Dust kr t))
                   (r (Rand 0.25 0.5))
                   (e (Decay2 (Mul n 0.02) 0.005 r)))
              (Mul (FSinOsc ar (* f (+ h 1)) 0) e)))))
  (mixFill p o))
