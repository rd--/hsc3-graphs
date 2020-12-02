; formlet
(let* ((f (x-line kr 10 400 8 remove-synth))
       (i (mul (blip ar f 1000) 0.1)))
  (formlet i 1000 0.01 0.1))
