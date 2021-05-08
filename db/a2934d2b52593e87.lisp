; Blip ; modulate frequency
(let ((f (XLine kr 20000 200 6 remove-synth)))
  (Mul (Blip ar f 100) 0.1))
