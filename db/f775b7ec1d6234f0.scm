; LFClipNoise ; modulate frequency
(let ((f (XLine 1000 10000 10 removeSynth)))
  (Mul (LFClipNoise f) 0.025))
