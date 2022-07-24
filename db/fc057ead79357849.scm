; LFClipNoise ; not quantization at high frequencies, c.f. LFDClipNoise
(let ((f (XLine 1000 20000 10 removeSynth)))
  (Mul (LFClipNoise f) 0.05))
