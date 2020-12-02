; pv-mag-freeze
(let ((s (sin-osc ar (mul-add (lf-noise1 kr 5.2) 250 400) 0))
      (f (sin-osc kr 0.2 0)))
  (pan2 (ifft* (pv-mag-freeze (fft* (local-buf 1 2048) s) f)) 0 0.25))
