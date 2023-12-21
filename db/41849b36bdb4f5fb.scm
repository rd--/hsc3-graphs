; LfdClipNoise ; LfClipNoise quantizes time steps at high freqs, LfdClipNoise does not
(let ((f (XLine 1000 20000 10 removeSynth)))
  (Mul (LfdClipNoise f) 0.05))
