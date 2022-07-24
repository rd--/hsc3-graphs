; BufFrames ; requires=buf
(let* ((b (ctl "buf" 0))
       (p (K2A (MouseX 0 (BufFrames b) 0 0.1))))
  (BufRd 1 b p 0 2))
