; Poll ; multichannel expansion is not implemented
(let ((t (Impulse kr 2 0))
      (i (Line kr 0 1 5 removeSynth)))
  (Poll t i 0 "test"))