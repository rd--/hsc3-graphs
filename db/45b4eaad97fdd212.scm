; BufDur ; requires=buf
(let* ((b (ctl "buf" 0))
       (t (Impulse (Recip (BufDur b)) 0))
       (p (Sweep t (BufSampleRate b))))
  (BufRd 1 b p 0 2))
