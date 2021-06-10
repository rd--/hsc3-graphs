; Formant ; modulate width frequency, other frequencies stay constant
(let ((w (XLine kr 800 8000 8 removeSynth)))
  (Mul (Formant ar 400 2000 w) 0.1))
