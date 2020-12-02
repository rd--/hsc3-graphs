; pv-bin-wipe
(let* ((a (mul (white-noise ar) 0.05))
       (b (mul (sin-osc ar 100 0) 0.2))
       (f (fft* (local-buf 1 2048) a))
       (g (fft* (local-buf 1 2048) b))
       (h (pv-bin-wipe f g (mouse-x kr -1 1 0 0.1))))
  (mul (ifft* h) 0.5))
