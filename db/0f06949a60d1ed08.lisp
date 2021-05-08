; TDuty ; Amplitude changes
(let* ((dur (Dseq dinf (make-mce (list 0.1 0.2 0.4 0.3))))
       (amp (Dseq dinf (make-mce (list 0.1 0.4 0.01 0.5 1.0))))
       (t (TDuty ar dur 0 do-nothing amp 0)))
  (Ringz t 1000 0.1))
