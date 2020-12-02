; pv-conformal-map
(pan2
 (ifft*
  (pv-conformal-map
   (fft* (local-buf 1 2048) (mul (sound-in 0) 0.5)) (mouse-x kr -1 1 0 0.1)
   (mouse-y kr -1 1 0 0.1)))
 0
 1)
