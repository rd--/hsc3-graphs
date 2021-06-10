; xline
(let ((f (XLine kr 200 17000 10 removeSynth)))
  (Mul (SinOsc ar f 0) 0.05))
