; PlayBuf ; loop playback, accelerating pitch
(let ((b (ctl kr "buf" 0))
      (rate (XLine kr 0.1 100 60 removeSynth)))
 (PlayBuf 1 ar b rate 1 0 1 0))
