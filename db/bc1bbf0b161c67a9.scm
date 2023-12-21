; BufRd ; requires=buf
(let* ((b (ctl "buf" 0))
       (phase (Add (LfTri 0.1 0)
                   (Mul (LfTri 0.23 0) (BufFrames b)))))
  (BufRd 1 b phase 0 1))
