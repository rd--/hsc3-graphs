; pv_binshift
(let ((snd (let* ((f1 (Squared (MulAdd (SinOsc kr 0.08 0) 6 6.2)))
                  (f2 (SinOsc kr f1 0)))
             (SinOsc ar (MulAdd f2 100 800) 0)))
      (x (MouseX kr -10 100 0 0.1))
      (y (MouseY kr 1 4 0 0.1)))
  (Mul (ifft* (PV_BinShift (fft* (LocalBuf 1 2048) snd) y x 0)) 0.1))
