; LocalBuf ; allocate a buffer local to the synthesis graph, 1-channel, 2048-places
(let* ((nc 1)
       (nf 2048)
       (buf (LocalBuf nc nf))
       (c1 (fft* (LocalBuf 1 2048) (Mul (WhiteNoise ar) 0.1)))
       (c2 (PV_BrickWall c1 (Mul (SinOsc kr (ctl kr "lfo_freq" 0.1) 0) 0.75))))
  (ifft* c2))
