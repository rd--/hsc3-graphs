; pulsing bottles (jmcc) #2
(!+
 (lambda ()
   (Pan2 (Resonz (Mul3 (WhiteNoise)
		       (LfPulse (Rand 4 14) 0 (Rand 0 0.7))
		       0.1)
		 (Add 400 (LinRand 0 7000 0))
		 0.01)
	 (SinOsc
	  (Rand 0.1 0.5)
	  (Rand 0 (Mul pi 2)))
	 1))
 6)
