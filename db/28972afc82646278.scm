; Formant ; modulate Formant frequency, fundamental frequency stays constant
(let ((f (XLine 400 4000 8 removeSynth)))
  (Mul (Formant (Mce2 200 300) f 200) 0.1))
