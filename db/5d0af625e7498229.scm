; PlayBuf ; trigger playback at each pulse
(let ((b (ctl kr "buf" 0)))
  (PlayBuf 1 ar b (BufRateScale kr b) (Impulse kr 2 0) 0 noLoop doNothing))
