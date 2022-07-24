; Formlet
(let* ((f (XLine 10 400 8 removeSynth))
       (i (Mul (Blip f 1000) 0.1)))
  (Formlet i 1000 0.01 0.1))
