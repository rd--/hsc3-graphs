; PlayBuf ; trigger playback at each Pulse (diminishing intervals)
(let ((b (ctl kr "buf" 0))
      (t (Impulse kr (XLine kr 0.1 100 10 remove-synth) 0)))
  (PlayBuf 1 ar b (BufRateScale kr b) t 0 0 0))
