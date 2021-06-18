; CpsMidi
(let ((f (Line kr 600 900 5 removeSynth)))
  (Mul (Saw ar (MidiCps (CpsMidi f))) 0.05))
