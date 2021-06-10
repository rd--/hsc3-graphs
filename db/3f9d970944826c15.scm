; LFClipNoise ; not quantization at high frequencies, c.f. lfd-clip-noise
(let ((f (XLine kr 1000 20000 10 removeSynth)))
  (Mul (LFClipNoise ar f) 0.05))
