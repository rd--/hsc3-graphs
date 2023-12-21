; !+ ; Mix . Dup
(let ((n 6)
      (o (lambda () (Mul (FSinOsc (Rand 200 700) 0) 0.05))))
  (!+ o n))
