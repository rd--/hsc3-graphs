; xline
(let ((f (XLine kr 200 17000 10 remove-synth)))
  (Mul (SinOsc ar f 0) 0.05))
