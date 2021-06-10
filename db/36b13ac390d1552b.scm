; SinOsc ; modulate phase
(let* ((f (XLine kr 20 8000 10 removeSynth))
       (p (Mul (SinOsc ar f 0) (* pi 2))))
  (Mul (SinOsc ar 800 p) 0.1))
