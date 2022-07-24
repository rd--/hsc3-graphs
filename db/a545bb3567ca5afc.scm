; BufRd ; requires=buf
(let ((b (ctl "buf" 0)))
  (BufRd 1 b (Mul (SinOsc 0.1 0) (BufFrames b)) 0 2))
