; SinOsc ; modulate freq
(let ((f (XLine 2000 200 1 removeSynth)))
  (Mul (SinOsc f 0) 0.1))
