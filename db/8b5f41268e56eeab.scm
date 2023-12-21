; Ringz
(let ((n (Mul (WhiteNoise) 0.001)))
  (!+ (lambda ()
	(let ((f (XLn (Rand 100 5000) (Rand 100 5000) 20)))
	  (Ringz n f 0.5)))
      10))
