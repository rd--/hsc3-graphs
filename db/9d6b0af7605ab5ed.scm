; formlet
(let* ((f (XLine kr 10 400 8 removeSynth))
       (i (Mul (Blip ar f 1000) 0.1)))
  (Formlet i 1000 0.01 0.1))
