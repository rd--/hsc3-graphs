; PV_BinScramble ; aDC input
(let* ((a (Mul (sound-in (mce2 0 1)) 4.0))
       (f (fft* (LocalBuf 1 2048) a))
       (g (PV_BinScramble f
			  (MouseX kr 0.25 1.0 0 0.1)
			  (MouseY kr 0.25 1.0 0 0.1)
			  (Impulse kr (MulAdd (LFNoise0 kr 2) 8 10) 0)))
       (h (ifft* g)))
  (Pan2 h 0 0.5))
