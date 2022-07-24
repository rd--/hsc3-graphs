; Klank ; c.f. Klang
(let ((i (Mul (Impulse 2 0) 0.1))
      (d (klankData
	  (list 800 1071 1153 1723)
	  (replicate 5 1)
	  (replicate 5 1))))
  (Klank i 1 0 1 d))
