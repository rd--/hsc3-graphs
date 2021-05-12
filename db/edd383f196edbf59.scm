; BufDur ; requires=buf
(let* ((b (ctl kr "buf" 0))
       (t (Impulse ar (Recip (BufDur kr b)) 0))
       (p (Sweep t (BufSampleRate kr b))))
  (BufRd 1 ar b p 0 2))
