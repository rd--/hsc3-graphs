; Blip ; modulate number of harmonics
(let ((h (Line kr 1 100 20 remove-synth)))
  (Mul (Blip ar 200 h) 0.1))
