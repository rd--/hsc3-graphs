; cps-oct
(let ((f (OctCPS (CPSOct (XLine kr 600 900 6 removeSynth)))))
  (Mul (Saw ar f) 0.05))
