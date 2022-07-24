; SinOsc ; modulate phase
(let* ((f (XLine 20 8000 10 removeSynth))
       (p (Mul (SinOsc f 0) (* pi 2))))
  (Mul (SinOsc 800 p) 0.1))
