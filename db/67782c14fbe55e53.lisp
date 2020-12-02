; buf-dur ; requires=buf
(let* ((b (ctl kr "buf" 0))
       (t (impulse ar (recip (buf-dur kr b)) 0))
       (p (sweep t (buf-sample-rate kr b))))
  (buf-rd 1 ar b p 0 2))
