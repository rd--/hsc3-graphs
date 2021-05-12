; BufFrames
(let* ((b (ctl kr "buf" 0))
       (p (K2A (MouseX kr 0 (BufFrames kr b) 0 0.1))))
  (BufRd 1 ar b p 0 2))
