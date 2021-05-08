; pv_conformalmap
(Pan2
 (ifft*
  (PV_ConformalMap
   (fft* (LocalBuf 1 2048) (Mul (sound-in 0) 0.5)) (MouseX kr -1 1 0 0.1)
   (MouseY kr -1 1 0 0.1)))
 0
 1)
