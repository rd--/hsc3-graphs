; Poll ; multichannel expansion is not implemented
(let ((t (Impulse 2 0))
      (i (Line 0 1 5 removeSynth)))
  (Poll t i 0 "test"))
