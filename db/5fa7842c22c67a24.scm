; Formant ; modulate width frequency, other frequencies stay constant
(let ((w (XLine 800 8000 8 removeSynth)))
  (Mul (Formant 400 2000 w) 0.1))
