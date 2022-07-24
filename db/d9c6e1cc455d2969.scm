; IRand
(let ((f (IRand 60 72))
      (a (Line 0.1 0 0.1 removeSynth)))
  (Mul (FSinOsc (MidiCps f) 0) a))
