; PlayBuf ; loop playback, accelerating pitch
(let ((b (ctl "buf" 0))
      (rate (XLine 0.1 100 60 removeSynth)))
 (PlayBuf 1 b rate 1 0 1 0))
