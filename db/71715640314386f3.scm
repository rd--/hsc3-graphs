; babbling brook (jmcc) #sc3
(let* ((brook
	(lambda (f m a g)
	  (Mul
	   (Rhpf
	    (OnePole (BrownNoise) 0.99)
	    (MulAdd (Lpf (BrownNoise) f) m a)
	    0.03)
	   g))))
  (Add
   (! (lambda () (brook 14 400 500 0.06)) 2)
   (! (lambda () (brook 20 800 1000 0.1)) 2)))
