; blip ; modulate number of harmonics
(let ((h (line kr 1 100 20 remove-synth)))
  (mul (blip ar 200 h) 0.1))
