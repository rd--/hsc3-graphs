; syncsaw
(let ((f (Line kr 100 800 12 removeSynth)))
  (Mul (SyncSaw ar 100 f) 0.05))
