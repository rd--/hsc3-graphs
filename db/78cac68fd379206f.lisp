; just foote metric, foote never triggers with threshold over 1.0, mouse control of threshold
(let* ((src (sound-in 0))
       (dtc (PV_HainsworthFoote (fft* (LocalBuf 1 2048) src)
				0.0
				1.0
				(MouseX kr 0.0 1.1 0 0.1)
				0.02))
       (cmp (Mul (SinOsc ar 440 0)
		 (Decay (Mul 0.1 dtc) 0.1))))
  (Mul (mce2 src cmp) 0.1))
