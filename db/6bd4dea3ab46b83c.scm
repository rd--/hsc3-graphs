; dyn-klank
(let* ((i (lambda (f) (Mul (Impulse ar (lin-lin (LFNoise0 kr f) -1 1 3 12) 0) 0.05)))
       (t (lambda (i d l r) (map (lambda (e) (Mul e (TRand l r i))) d)))
       (d (lambda (i f r)
	    (klank-data (t i f 0.5 2)
			(replicate 4 1)
			(t i r 0.1 10))))
       (f1 (list 800 1071 1153 1723))
       (f2 (list 786 1083 1169 1715))
       (r1 (list 1 0.95 0.75 1.25))
       (r2 (list 1 1.35 0.95 1.15))
       (i1 (i 1.5))
       (i2 (i 1.25)))
  (mce2 (dyn-klank i1 1 0 1 (d i1 f1 r1))
        (dyn-klank i2 1 0 1 (d i2 f2 r2))))