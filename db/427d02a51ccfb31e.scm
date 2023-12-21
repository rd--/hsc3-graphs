; PV_BinScramble ; adc input ; warning=feedbackloop!
(let* ((a (Mul (SoundIn (list 0 1)) 4.0))
       (f (FftDefaults (LocalBuf 1 2048) a))
       (g (PV_BinScramble
	   f
	   (MouseX 0.25 1.0 0 0.1)
	   (MouseY 0.25 1.0 0 0.1)
	   (Impulse (MulAdd (LfNoise0 2) 8 10) 0)))
       (h (IfftDefaults g)))
  (Pan2 h 0 0.5))
