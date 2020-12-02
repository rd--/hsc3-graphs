; pv-copy ; proof of concept, silence
(let* ((in (lf-clip-noise ar 100))
       (c0 (fft* (local-buf 1 2048) in))
       (c1 (pv-copy c0 (local-buf 1 2048))))
  (sub (ifft* c0) (ifft* c1)))
