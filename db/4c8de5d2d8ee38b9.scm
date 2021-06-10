; LFClipNoise ; modulate frequency
(let ((f (XLine kr 1000 10000 10 removeSynth)))
  (Mul (LFClipNoise ar f) 0.025))
