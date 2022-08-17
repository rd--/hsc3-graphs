; Dbufrd ; buffer as a time pattern
(let* ((b0 (asLocalBuf (dup (lambda () (expRand 200 500)) 24)))
       (b1 (asLocalBuf (dup (lambda () (choose (list 1 0.5 0.25))) 24)))
       (p (Dseq
	   dinf
	   (List
	    (Dseq 3 (list 0 3 5 0 3 7 0 5 9))
            (Dbrown 5 0 23 1))))
       (d (Mul (Dbufrd b1 (Dseries dinf 0 1) 1) 0.5))
       (l (Dbufrd b0 p 1)))
  (Mul (SinOsc (Duty d 0 doNothing l) 0) 0.1))
