; Normalizer
(let ((z (Mul (Decay2 (Impulse 8 (Mul (LfSaw 0.25 -0.6) 0.7))
		      0.001
		      0.3)
	      (FSinOsc 500 0))))
  (Mul 0.1 (Mce2 z (Normalizer z 0.4 0.01))))
