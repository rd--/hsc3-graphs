; rlpf
(let* ((f1 (XLine 0.7 300 20 removeSynth))
       (f2 (MulAdd (FSinOsc f1 0) 3600 4000)))
  (RLPF (Mul (Saw 200) 0.05) f2 0.2))
