; mixFill
(let ((n 6)
      (o (lambda (_) (Mul (FSinOsc ar (Rand 200 700) 0) 0.05))))
  (mixFill n o))
