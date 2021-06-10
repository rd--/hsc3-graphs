; OctCPS
(let ((f (OctCPS (Round (Line kr 2 9 6 removeSynth) 1/12))))
  (Mul (Saw ar f) 0.05))
