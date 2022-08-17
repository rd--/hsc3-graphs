; Dbufrd
(let* ((b (asLocalBuf (dup (lambda () (expRand 200 500)) 24)))
       (q (Dseq 3 (list 0 3 5 0 3 7 0 5 9)))
       (p (Dseq dinf (List q (Dbrown 5 0 23 1))))
       (t (Dust 10)))
  (Mul (SinOsc (Demand t 0 (Dbufrd b p 1)) 0) 0.1))
