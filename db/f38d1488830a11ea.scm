; FreqShift ; shifting a complex tone by 1 Hz rising to 500Hz
(let ((i (SinOscBank (list 101 303 606 808) 1 1))
      (s (XLine 1 500 5 removeSynth)))
  (Mul (FreqShift i s 0) 0.1))
