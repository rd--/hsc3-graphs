; lpf
(let ((f (XLine kr 0.7 300 20 remove-synth)))
  (LPF (Mul (Saw ar 200) 0.1)
       (MulAdd (FSinOsc kr f 0) 3600 4000)))
