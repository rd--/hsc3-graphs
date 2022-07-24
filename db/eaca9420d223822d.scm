; DynKlank
(let* ((i (Mul (Impulse 3 0) 0.1))
       (f (list 800 1071 1153 1723))
       (r (list 1 1 1 1))
       (x (MouseX 0.5 2 1 0.1))
       (y (MouseY 0.1 10 1 0.1))
       (d (klankData
	   (map (lambda (e) (Mul e x)) f)
	   (replicate 4 1)
	   (map (lambda (e) (Mul e y)) r))))
  (DynKlank i 1 0 1 d))
