; CpsOct
(let ((f (OctCps (CpsOct (XLine kr 600 900 6 removeSynth)))))
  (Mul (Saw ar f) 0.05))
