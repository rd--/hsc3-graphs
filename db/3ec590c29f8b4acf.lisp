; pv-bin-scramble ; adc input
(let* ((a (mul (sound-in (mce2 0 1)) 4.0))
       (f (fft* (local-buf 1 2048) a))
       (g (pv-bin-scramble f
			  (mouse-x kr 0.25 1.0 0 0.1)
			  (mouse-y kr 0.25 1.0 0 0.1)
			  (impulse kr (mul-add (lf-noise0 kr 2) 8 10) 0)))
       (h (ifft* g)))
  (pan2 h 0 0.5))
