; LFClipNoise ; modulate frequency
(let ((f (XLine kr 1000 10000 10 remove-synth)))
  (Mul (LFClipNoise ar f) 0.025))
