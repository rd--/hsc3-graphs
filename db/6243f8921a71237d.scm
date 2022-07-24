; PlayBuf ; trigger playback at each pulse
(let ((b (ctl "buf" 0)))
  (PlayBuf 1 b (BufRateScale b) (Impulse 2 0) 0 noLoop doNothing))
