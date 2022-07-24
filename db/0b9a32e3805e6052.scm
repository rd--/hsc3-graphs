; lpf
(let ((f (XLine 0.7 300 20 removeSynth)))
  (LPF (Mul (Saw 200) 0.1)
       (MulAdd (FSinOsc f 0) 3600 4000)))
