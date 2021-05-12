; octcps
(let ((f (OctCPS (Round (Line kr 2 9 6 remove-synth) (/ 1 12)))))
  (Mul (Saw ar f) 0.05))
