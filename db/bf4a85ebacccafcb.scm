; LfClipNoise ; not quantization at high frequencies, c.f. LfdClipNoise
(let ((f (XLine 1000 20000 10 removeSynth)))
  (Mul (LfClipNoise f) 0.05))
