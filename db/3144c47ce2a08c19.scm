; EnvCoord ; co-ordinate based static envelope generator
(let* ((d (EnvCoord
	   (list
	    (cons 0 0)
            (cons 0.75 1)
            (cons 1 0))
           1
	   1
	   'linear))
       (e (EnvGen 1 1 0 7 removeSynth d)))
  (Mul3 (SinOsc (LinLin e 0 1 220 880) 0) e 0.1))
