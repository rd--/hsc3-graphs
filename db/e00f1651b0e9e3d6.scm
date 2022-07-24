; CpsMidi
(let ((f (Line 600 900 5 removeSynth)))
  (Mul (Saw (MidiCps (CpsMidi f))) 0.05))
