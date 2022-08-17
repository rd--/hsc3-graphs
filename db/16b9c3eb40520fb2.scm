; PV_Copy ; proof of concept, silence
(let* ((in (LFClipNoise 100))
       (c0 (FftDefaults (LocalBuf 1 2048) in))
       (c1 (PV_Copy c0 (LocalBuf 1 2048))))
  (Sub (IfftDefaults c0) (IfftDefaults c1)))
