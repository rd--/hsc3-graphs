; lfdClipNoise ; lfClipNoise quantizes time steps at high freqs, lfdClipNoise does not
(let ((f (XLine 1000 20000 10 removeSynth)))
  (Mul (LFDClipNoise f) 0.05))
