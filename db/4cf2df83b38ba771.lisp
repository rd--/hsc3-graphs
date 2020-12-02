; fft
(let* ((f1 (squared (mul-add (sin-osc kr 0.08 0) 6 6.2)))
       (f2 (mul-add (sin-osc kr f1 0) 100 800))
       (s (sin-osc ar f2 0)))
  (mul (ifft* (fft* (local-buf 1 2048) s)) 0.1))
