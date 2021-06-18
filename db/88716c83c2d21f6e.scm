; irand
(let ((f (IRand 60 72))
      (a (Line kr 0.1 0 0.1 removeSynth)))
  (Mul (FSinOsc ar (MidiCps f) 0) a))
