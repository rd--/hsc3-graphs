; round
(let ((n (Line kr 24 108 6 removeSynth)))
  (Mul (Saw ar (MidiCps (Round n 1))) 0.05))
