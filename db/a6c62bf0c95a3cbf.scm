; pv_binshift
(let ((snd (let* ((f1 (Squared (MulAdd (SinOsc 0.08 0) 6 6.2)))
                  (f2 (SinOsc f1 0)))
             (SinOsc (MulAdd f2 100 800) 0)))
      (x (MouseX -10 100 0 0.1))
      (y (MouseY 1 4 0 0.1)))
  (Mul (ifftDefaults (PV_BinShift (fftDefaults (LocalBuf 1 2048) snd) y x 0)) 0.1))
