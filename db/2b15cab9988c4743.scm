; local-buf; not clearing the buffer accesses old data, slowly overwrite data with noise
(let* ((b (LocalBuf 2 2048))
       (nf (BufFrames kr b))
       (x (MouseX kr 1 2 linear 0.2))
       (rd (Mul (PlayBuf 2 ar b x 1 0 loop do-nothing) 0.1))
       (wr (lambda (p i) (BufWr b (lin-lin p -1 1 0 nf) loop i)))
       (n (clone 2 (lambda () (WhiteNoise ar))))
       (ph (LFNoise0 ar 530)))
  (mrg2 rd (wr ph n)))
