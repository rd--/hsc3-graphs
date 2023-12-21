; TDuty ; Amplitude changes
(let* ((dur (Dseq inf (list 0.1 0.2 0.4 0.3)))
       (amp (Dseq inf (list 0.1 0.4 0.01 0.5 1.0)))
       (t (TDuty dur 0 doNothing amp 0)))
  (Ringz t 1000 0.1))
