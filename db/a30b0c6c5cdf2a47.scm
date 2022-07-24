; BufRd ; requires=buf
(let* ((b (ctl "buf" 0))
       (phase (Add (LFTri 0.1 0)
                   (Mul (LFTri 0.23 0) (BufFrames b)))))
  (BufRd 1 b phase 0 1))
