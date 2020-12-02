; buf-frames
(let* ((b (ctl kr "buf" 0))
       (p (k2a (mouse-x kr 0 (buf-frames kr b) 0 0.1))))
  (buf-rd 1 ar b p 0 2))
