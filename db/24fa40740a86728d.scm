; LfClipNoise ; modulate frequency
(let ((f (XLine 1000 10000 10 removeSynth)))
  (Mul (LfClipNoise f) 0.025))
