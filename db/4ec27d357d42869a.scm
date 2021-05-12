; BufRd
(let* ((b (ctl kr "buf" 0))
       (phase (Add (LFTri ar 0.1 0)
                   (Mul (LFTri ar 0.23 0) (BufFrames ir b)))))
  (BufRd 1 ar b phase 0 1))
