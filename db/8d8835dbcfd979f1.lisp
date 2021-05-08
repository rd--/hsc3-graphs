; rlpf
(let* ((f1 (XLine kr 0.7 300 20 remove-synth))
       (f2 (MulAdd (FSinOsc kr f1 0) 3600 4000)))
  (RLPF (Mul (Saw ar 200) 0.05) f2 0.2))
