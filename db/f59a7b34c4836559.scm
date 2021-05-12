; lfdClipNoise ; lfClipNoise quantizes time steps at high freqs, lfdClipNoise does not
(let ((f (XLine kr 1000 20000 10 remove-synth)))
  (Mul (LFDClipNoise ar f) 0.05))
