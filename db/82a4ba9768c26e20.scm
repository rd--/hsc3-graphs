; http://www.fredrikolofsson.com/f0blog/?q=node/617 (f0)
(let* ((c 200000)
       (b (ClearBuf (LocalBuf 2 c)))
       (d (BufRd 2 ar b (Mul (SinOsc ar (Mul (mce2 2 3) 9) 0) c) 0 1))
       (s (Mul (Abs (SinOsc ar (mce2 99 145) 0)) c))
       (w (BufWr b s 1 (FDiv (SinOsc ar (FDiv 3 (mce2 2 3)) 0) 3))))
  (mrg2 (Mul d 0.1) w))
