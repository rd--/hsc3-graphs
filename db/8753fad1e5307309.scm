; record scratcher (josh parmenter) ; requires=buf
(let* ((b (ctl "buf" 0))
       (dup (lambda (a) (Mce2 a a)))
       (x (MouseX -10 10 linear 0.2))
       (dx (Sub x (DelayN x 0.1 0.1)))
       (bdx (Add (MouseButton 1 0 0.3) dx))
       (bdxr (Mul bdx (BufRateScale b))))
  (dup (PlayBuf 1 b bdxr 0 0 loop doNothing)))
