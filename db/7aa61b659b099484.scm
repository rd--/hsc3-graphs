; Bpf
(let* ((f1 (XLine 0.7 300 20 removeSynth))
       (f2 (MulAdd (FSinOsc f1 0) 3600 4000)))
  (Bpf (Mul (Saw 200) 0.25) f2 0.3))
