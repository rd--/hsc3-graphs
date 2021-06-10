; ringz
(let ((n (Mul (WhiteNoise ar) 0.001)))
  (mixFill
   10
   (lambda (_)
     (let ((f (XLine kr (Rand 100 5000) (Rand 100 5000) 20 doNothing)))
       (Ringz n f 0.5)))))
