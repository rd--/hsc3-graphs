; BufFrames ; requires=buf
(let* ((b (ctl "buf" 0))
       (p (Phasor 0 (BufRateScale b) 0 (BufFrames b) 0)))
  (BufRd 1 b p 0 2))
