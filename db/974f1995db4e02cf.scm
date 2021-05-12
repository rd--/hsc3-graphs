; BufRateScale
(let* ((b (ctl kr "buf" 0))
       (r (Mul (Rand 0.5 2) (BufRateScale kr b)))
       (p (Phasor ar 0 r 0 (BufFrames kr b) 0)))
  (BufRd 1 ar b p 0 2))
