; Formant ; modulate Formant frequency, fundamental frequency stays constant
(let ((f (XLine kr 400 4000 8 remove-synth)))
  (Mul (Formant ar (mce2 200 300) f 200) 0.1))
