; DynKlank ; c.f. klank
(let ((i (Mul (Impulse ar 2 0) 0.1))
      (d (klankData (list 800 1071 1153 1723)
		     (replicate 4 1)
		     (replicate 4 1))))
  (DynKlank i 1 0 1 d))
