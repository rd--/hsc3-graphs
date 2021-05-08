; record scratcher (josh parmenter) ; requires=buf
(let* ((b (ctl kr "buf" 0))
       (dup (lambda (a) (mce2 a a)))
       (x (MouseX kr -10 10 linear 0.2))
       (dx (Sub x (DelayN x 0.1 0.1)))
       (bdx (Add (MouseButton kr 1 0 0.3) dx))
       (bdxr (Mul bdx (BufRateScale kr b))))
  (dup (PlayBuf 1 ar b bdxr 0 0 loop do-nothing)))
