; t-duty ; mouse control of rate
(let* ((dur (mouse-x kr 0.01 2 1 0.1))
       (amp (dseq dinf (make-mce (list 0.1 0.4 0.01 0.5 1.0))))
       (t (t-duty ar dur 0 0 amp 0)))
  (ringz t 1000 0.1))
