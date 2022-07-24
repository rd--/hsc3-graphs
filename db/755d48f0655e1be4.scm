; Formlet ; modulate Formant frequency
(let ((i (Mul (Blip (MulAdd (SinOsc 5 0) 20 300) 1000) 0.1))
      (f (XLine 1500 700 8 removeSynth)))
  (Formlet i f 0.005 0.04))
