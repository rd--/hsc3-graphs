; pv-mul
(let* ((a (mul (sin-osc ar 500 0) 0.5))
       (b (mul (sin-osc ar (line kr 100 400 5 do-nothing) 0) 0.5))
       (ca (fft* (local-buf 1 2048) a))
       (cb (fft* (local-buf 1 2048) b))
       (cc (pv-mul ca cb)))
  (mul 0.1 (ifft* cc)))
