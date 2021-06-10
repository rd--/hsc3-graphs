; d-bufrd ; buffer as a time pattern
(let* ((b0 (asLocalBuf 1 (map (lambda (_) (s:exp-rand 200 500)) (make-list 24))))
       (b1 (asLocalBuf 1 (map (lambda (_) (s:l-choose (list 1 0.5 0.25))) (make-list 24))))
       (p (Dseq dinf (Mce2 (Dseq 3 (asMce (list 0 3 5 0 3 7 0 5 9)))
                           (Dbrown 5 0 23 1))))
       (d (Mul (Dbufrd b1 (Dseries dinf 0 1) 1) 0.5))
       (l (Dbufrd b0 p 1)))
  (Mul (SinOsc ar (Duty kr d 0 doNothing l) 0) 0.1))
