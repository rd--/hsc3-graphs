; BufRateScale ; requires=buf
(let* ((b (ctl "buf" 0))
       (r (Mul (Rand 0.5 2) (BufRateScale b)))
       (p (Phasor 0 r 0 (BufFrames b) 0)))
  (BufRd 1 b p 0 2))
