; octcps
(let ((f (OctCPS (Line kr 2 9 6 remove-synth))))
  (Mul (Saw ar f) 0.05))
