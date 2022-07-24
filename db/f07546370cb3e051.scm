; mixFill
(let ((n 6)
      (o (lambda (_) (Mul (FSinOsc (Rand 200 700) 0) 0.05))))
  (mixFill n o))
