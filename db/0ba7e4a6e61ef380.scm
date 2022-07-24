; BufRd ; requires=buf
(let* ((b (ctl "buf" 0))
       (phase (Mul (LFNoise1 (MouseX (Mce2 5 10) 100 0 0.1))
                   (BufFrames b))))
  (BufRd 1 b phase 0 1))
