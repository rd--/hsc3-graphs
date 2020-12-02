; formant ; modulate fundamental frequency, formant frequency stays constant
(let ((f (x-line kr 400 1000 8 remove-synth)))
  (mul (formant ar f 2000 800) 0.1))
