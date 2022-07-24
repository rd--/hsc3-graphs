; Blip ; modulate frequency
(let ((f (XLine 20000 200 6 removeSynth)))
  (Mul (Blip f 100) 0.1))
