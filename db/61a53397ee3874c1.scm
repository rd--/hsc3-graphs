; ringz
(let ((n (Mul (WhiteNoise) 0.001)))
  (mixFill
   10
   (lambda (_)
     (let ((f (XLine (Rand 100 5000) (Rand 100 5000) 20 doNothing)))
       (Ringz n f 0.5)))))
