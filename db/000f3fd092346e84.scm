; CpsMidi
(let ((f (Ln 600 900 5)))
  (Mul (Saw (MidiCps (CpsMidi f))) 0.05))
