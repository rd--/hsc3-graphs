; FreqShift ; shifting a 100Hz tone by 1 Hz rising to 500Hz
(let ((i (SinOsc 100 0))
      (s (XLine 1 500 5 removeSynth)))
  (Mul (FreqShift i s 0) 0.1))
