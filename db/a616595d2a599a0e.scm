; Klank ; c.f. klang
(let ((i (Mul (Impulse ar 2 0) 0.1))
      (d (klankData '(800 1071 1153 1723)
		     (replicate 5 1)
		     (replicate 5 1))))
  (Klank i 1 0 1 d))
