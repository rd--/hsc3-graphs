; http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)
(let* ((c 200000)
       (b (ClearBuf (LocalBuf 2 c)))
       (d (BufRd 2 ar b (Mul (SinOsc ar (Mce2 18 27) 0) c) 0 1))
       (s (Mul (Abs (SinOsc ar (Mce2 99 145) 0)) c))
       (w (BufWr b s 1 (FDiv (SinOsc ar (Mce2 3/2 1) 0) 3))))
  (Mrg2 (Mul d 0.1) w))