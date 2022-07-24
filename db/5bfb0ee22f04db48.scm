; Dbufrd
(let* ((b (asLocalBuf 1 (map (lambda (_) (s:exp-rand 200 500)) (make-list 24))))
       (q (Dseq 3 (asMce (list 0 3 5 0 3 7 0 5 9))))
       (p (Dseq dinf (Mce2 q (Dbrown 5 0 23 1))))
       (t (Dust 10)))
  (Mul (SinOsc (Demand t 0 (Dbufrd b p 1)) 0) 0.1))
