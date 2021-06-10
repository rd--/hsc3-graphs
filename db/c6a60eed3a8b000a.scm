; SinOsc ; modulate freq
(let ((f (XLine kr 2000 200 1 removeSynth)))
  (Mul (SinOsc ar f 0) 0.1))
