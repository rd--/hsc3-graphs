; local-buf; not clearing the buffer accesses old data, slowly overwrite data with noise
(let* ((b (local-buf 2 2048))
       (nf (buf-frames kr b))
       (x (mouse-x kr 1 2 linear 0.2))
       (rd (mul (play-buf 2 ar b x 1 0 loop do-nothing) 0.1))
       (wr (lambda (p i) (buf-wr b (lin-lin p -1 1 0 nf) loop i)))
       (n (clone 2 (lambda () (white-noise ar))))
       (ph (lf-noise0 ar 530)))
  (mrg2 rd (wr ph n)))
