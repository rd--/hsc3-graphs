; t-duty ; a rhythm
(let ((s (dseq dinf (make-mce (list 0.1 0.2 0.4 0.3)))))
  (t-duty ar s 0 do-nothing 1 0))
