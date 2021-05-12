; normalizer
(let ((z (Mul (Decay2 (Impulse ar 8 (Mul (LFSaw kr 0.25 -0.6) 0.7))
		      0.001
		      0.3)
	      (FSinOsc ar 500 0))))
  (Mul 0.1 (mce2 z (Normalizer z 0.4 0.01))))
