; just foote metric, foote never triggers with threshold over 1.0, mouse control of threshold
(let* ((src (sound-in 0))
       (dtc (pv-hainsworth-foote (fft* (local-buf 1 2048) src)
				0.0
				1.0
				(mouse-x kr 0.0 1.1 0 0.1)
				0.02))
       (cmp (mul (sin-osc ar 440 0)
		 (decay (mul 0.1 dtc) 0.1))))
  (mul (mce2 src cmp) 0.1))
