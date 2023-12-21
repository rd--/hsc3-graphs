; local-buf; not clearing the buffer accesses old data, slowly overwrite data with noise
(let* ((b (LocalBuf 2 2048))
       (nf (BufFrames b))
       (x (MouseX 1 2 linear 0.2))
       (rd (Mul (PlayBuf 2 b x 1 0 loop doNothing) 0.1))
       (wr (lambda (p i) (BufWr b (LinLin p -1 1 0 nf) loop i)))
       (n (! (lambda () (WhiteNoise)) 2))
       (ph (LfNoise0 530)))
  (Mrg2 rd (wr ph n)))
