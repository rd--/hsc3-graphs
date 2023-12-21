; !+
(let ((n 18)
      (o (lambda () (Pan2 (FSinOsc (Rand 200 700) 0) (Rand -1 1) (Rand 0.01 0.05)))))
  (!+ o n))
