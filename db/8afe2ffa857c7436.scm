; FreqShift ; shifting a 100Hz tone by 1 Hz rising to 500Hz
(let ((i (SinOsc ar 100 0))
      (s (XLine kr 1 500 5 remove-synth)))
  (Mul (FreqShift i s 0) 0.1))
