; Formlet ; modulate Formant frequency
(let ((i (Mul (Blip ar (MulAdd (SinOsc kr 5 0) 20 300) 1000) 0.1))
      (f (XLine kr 1500 700 8 remove-synth)))
  (Formlet i f 0.005 0.04))
