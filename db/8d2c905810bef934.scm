; PlayBuf ; trigger playback at each Pulse (diminishing intervals)
(let ((b (ctl "buf" 0))
      (t (Impulse (XLine 0.1 100 10 removeSynth) 0)))
  (PlayBuf 1 b (BufRateScale b) t 0 0 0))
