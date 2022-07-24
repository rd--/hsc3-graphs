; Formant ; modulate fundamental frequency, Formant frequency stays constant
(let ((f (XLine 400 1000 8 removeSynth)))
  (Mul (Formant f 2000 800) 0.1))
