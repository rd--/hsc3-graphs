; BufRd
(let* ((b (ctl kr "buf" 0))
       (phase (Mul (LFNoise1 ar (MouseX kr (mce2 5 10) 100 0 0.1))
                   (BufFrames ir b))))
  (BufRd 1 ar b phase 0 1))
