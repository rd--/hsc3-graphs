; PV_HainsworthFoote ; just hainsworth metric, spot note transitions
(let* ((src (Mul (LFSaw ar (MulAdd (LFNoise0 kr 1) 90 400) 0) 0.5))
       (dtc (PV_HainsworthFoote (fftDefaults (LocalBuf 1 2048) src)
				1.0
				0.0
				0.9
				0.5))
       (cmp (Mul (SinOsc ar 440 0)
		 (Decay (Mul 0.1 dtc) 0.1))))
  (Mul (Mce2 src cmp) 0.1))
