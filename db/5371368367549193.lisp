; BufFrames
(let* ((b (ctl kr "buf" 0))
       (p (Phasor ar 0 (BufRateScale kr b) 0 (BufFrames kr b) 0)))
  (BufRd 1 ar b p 0 2))
