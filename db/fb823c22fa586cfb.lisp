; formant ; modulate width frequency, other frequencies stay constant
(let ((w (x-line kr 800 8000 8 remove-synth)))
  (mul (formant ar 400 2000 w) 0.1))
