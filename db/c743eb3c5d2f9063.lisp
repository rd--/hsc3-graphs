; local-buf ; allocate a buffer local to the synthesis graph, 1-channel, 2048-places
(let* ((nc 1)
       (nf 2048)
       (buf (local-buf nc nf))
       (c1 (fft* (local-buf 1 2048) (mul (white-noise ar) 0.1)))
       (c2 (pv-brick-wall c1 (mul (sin-osc kr (ctl kr "lfo_freq" 0.1) 0) 0.75))))
  (ifft* c2))
