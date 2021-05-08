; syncsaw
(let ((f (Line kr 100 800 12 remove-synth)))
  (Mul (SyncSaw ar 100 f) 0.05))
