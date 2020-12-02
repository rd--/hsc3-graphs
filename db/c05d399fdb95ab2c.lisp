; formlet ; modulate formant frequency
(let ((i (mul (blip ar (mul-add (sin-osc kr 5 0) 20 300) 1000) 0.1))
      (f (x-line kr 1500 700 8 remove-synth)))
  (formlet i f 0.005 0.04))
