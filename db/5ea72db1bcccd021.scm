; envCoord ; co-ordinate based static envelope generator
(let* ((d (envCoord
	   (list
	    (cons 0 0)
            (cons 0.75 1)
            (cons 1 0))
           1
	   1
	   (replicate 3 'linear)))
       (e (EnvGen 1 0.1 0 1 removeSynth d)))
  (Mul e (SinOsc 440 0)))
