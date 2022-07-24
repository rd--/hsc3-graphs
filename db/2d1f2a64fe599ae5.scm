; PV_BinScramble ; aDC input
(let* ((a (Mul (SoundIn (Mce2 0 1)) 4.0))
       (f (fftDefaults (LocalBuf 1 2048) a))
       (g (PV_BinScramble f
			  (MouseX 0.25 1.0 0 0.1)
			  (MouseY 0.25 1.0 0 0.1)
			  (Impulse (MulAdd (LFNoise0 2) 8 10) 0)))
       (h (ifftDefaults g)))
  (Pan2 h 0 0.5))
