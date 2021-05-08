; BPF
(let* ((f1 (XLine kr 0.7 300 20 remove-synth))
       (f2 (MulAdd (FSinOsc kr f1 0) 3600 4000)))
  (BPF (Mul (Saw ar 200) 0.25) f2 0.3))
