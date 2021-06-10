; PV_Copy ; proof of concept, silence
(let* ((in (LFClipNoise ar 100))
       (c0 (fftDefaults (LocalBuf 1 2048) in))
       (c1 (PV_Copy c0 (LocalBuf 1 2048))))
  (Sub (ifftDefaults c0) (ifftDefaults c1)))
