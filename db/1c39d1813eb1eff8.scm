; TDuty ; mouse control of rate
(let* ((dur (MouseX 0.01 2 1 0.1))
       (amp (Dseq dinf (list 0.1 0.4 0.01 0.5 1.0)))
       (t (TDuty dur 0 0 amp 0)))
  (Ringz t 1000 0.1))
