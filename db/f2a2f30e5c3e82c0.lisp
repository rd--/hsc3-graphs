; blip ; modulate frequency
(let ((f (x-line kr 20000 200 6 remove-synth)))
  (mul (blip ar f 100) 0.1))
