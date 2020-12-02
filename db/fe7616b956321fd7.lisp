; formant ; modulate formant frequency, fundamental frequency stays constant
(let ((f (x-line kr 400 4000 8 remove-synth)))
  (mul (formant ar (mce2 200 300) f 200) 0.1))
