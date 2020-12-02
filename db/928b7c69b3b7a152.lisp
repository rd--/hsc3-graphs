; pv-hainsworth-foote ; just hainsworth metric, spot note transitions
(let* ((src (mul (lf-saw ar (mul-add (lf-noise0 kr 1) 90 400) 0) 0.5))
       (dtc (pv-hainsworth-foote (fft* (local-buf 1 2048) src)
				1.0
				0.0
				0.9
				0.5))
       (cmp (mul (sin-osc ar 440 0)
		 (decay (mul 0.1 dtc) 0.1))))
  (mul (mce2 src cmp) 0.1))
