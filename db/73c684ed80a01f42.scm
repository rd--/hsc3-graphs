; Blip ; modulate number of harmonics
(let ((h (Line kr 1 100 20 removeSynth)))
  (Mul (Blip ar 200 h) 0.1))
