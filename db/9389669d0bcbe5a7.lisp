; t-duty ; amplitude changes
(let* ((dur (dseq dinf (make-mce (list 0.1 0.2 0.4 0.3))))
       (amp (dseq dinf (make-mce (list 0.1 0.4 0.01 0.5 1.0))))
       (t (t-duty ar dur 0 do-nothing amp 0)))
  (ringz t 1000 0.1))
