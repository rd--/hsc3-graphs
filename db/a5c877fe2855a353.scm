; mixFill
(let ((n 18)
      (o (lambda (_) (Pan2 (FSinOsc (Rand 200 700) 0) (Rand -1 1) (Rand 0.01 0.05)))))
  (mixFill n o))
