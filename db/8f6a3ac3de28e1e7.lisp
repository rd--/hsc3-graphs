; record scratcher (josh parmenter) ; requires=buf
(let* ((b (ctl kr "buf" 0))
       (dup (lambda (a) (mce2 a a)))
       (x (mouse-x kr -10 10 linear 0.2))
       (dx (sub x (delay-n x 0.1 0.1)))
       (bdx (add (mouse-button kr 1 0 0.3) dx))
       (bdxr (mul bdx (buf-rate-scale kr b))))
  (dup (play-buf 1 ar b bdxr 0 0 loop do-nothing)))
