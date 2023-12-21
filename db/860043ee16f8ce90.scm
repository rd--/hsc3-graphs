; babbling brook (jmcc) #sc3
(let* ((brook
	(lambda (f m a g)
	  (Mul
	   (Rhpf
	    (OnePole (BrownNoiseN 2) 0.99)
	    (MulAdd (Lpf (BrownNoiseN 2) f) m a)
	    0.03)
	   g))))
  (Add
   (brook 14 400 500 0.06)
   (brook 20 800 1000 0.1)))
