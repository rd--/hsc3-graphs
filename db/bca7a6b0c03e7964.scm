; Blip ; modulate number of harmonics
(let ((h (Line 1 100 20 removeSynth)))
  (Mul (Blip 200 h) 0.1))
