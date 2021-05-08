; BufRd
(let ((b (ctl kr "buf" 0)))
  (BufRd 1 ar b (Mul (SinOsc ar 0.1 0) (BufFrames ir b)) 0 2))
